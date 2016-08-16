{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.ELBV2.DeleteListener
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified listener.
--
-- Alternatively, your listener is deleted when you delete the load balancer it is attached to using < DeleteLoadBalancer>.
module Network.AWS.ELBV2.DeleteListener
    (
    -- * Creating a Request
      deleteListener
    , DeleteListener
    -- * Request Lenses
    , dlListenerARN

    -- * Destructuring the Response
    , deleteListenerResponse
    , DeleteListenerResponse
    -- * Response Lenses
    , dlrsResponseStatus
    ) where

import           Network.AWS.ELBV2.Types
import           Network.AWS.ELBV2.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the parameters for DeleteListener.
--
-- /See:/ 'deleteListener' smart constructor.
newtype DeleteListener = DeleteListener'
    { _dlListenerARN :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteListener' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dlListenerARN'
deleteListener
    :: Text -- ^ 'dlListenerARN'
    -> DeleteListener
deleteListener pListenerARN_ =
    DeleteListener'
    { _dlListenerARN = pListenerARN_
    }

-- | The Amazon Resource Name (ARN) of the listener.
dlListenerARN :: Lens' DeleteListener Text
dlListenerARN = lens _dlListenerARN (\ s a -> s{_dlListenerARN = a});

instance AWSRequest DeleteListener where
        type Rs DeleteListener = DeleteListenerResponse
        request = postQuery elbv2
        response
          = receiveXMLWrapper "DeleteListenerResult"
              (\ s h x ->
                 DeleteListenerResponse' <$> (pure (fromEnum s)))

instance Hashable DeleteListener

instance NFData DeleteListener

instance ToHeaders DeleteListener where
        toHeaders = const mempty

instance ToPath DeleteListener where
        toPath = const "/"

instance ToQuery DeleteListener where
        toQuery DeleteListener'{..}
          = mconcat
              ["Action" =: ("DeleteListener" :: ByteString),
               "Version" =: ("2015-12-01" :: ByteString),
               "ListenerArn" =: _dlListenerARN]

-- | Contains the output of DeleteListener.
--
-- /See:/ 'deleteListenerResponse' smart constructor.
newtype DeleteListenerResponse = DeleteListenerResponse'
    { _dlrsResponseStatus :: Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteListenerResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dlrsResponseStatus'
deleteListenerResponse
    :: Int -- ^ 'dlrsResponseStatus'
    -> DeleteListenerResponse
deleteListenerResponse pResponseStatus_ =
    DeleteListenerResponse'
    { _dlrsResponseStatus = pResponseStatus_
    }

-- | The response status code.
dlrsResponseStatus :: Lens' DeleteListenerResponse Int
dlrsResponseStatus = lens _dlrsResponseStatus (\ s a -> s{_dlrsResponseStatus = a});

instance NFData DeleteListenerResponse