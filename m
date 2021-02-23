Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DC2322958
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Feb 2021 12:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbhBWLPG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Feb 2021 06:15:06 -0500
Received: from smtp.asem.it ([151.1.184.197]:59424 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232346AbhBWLPE (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Feb 2021 06:15:04 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000823976.MSG 
        for <linux-watchdog@vger.kernel.org>; Tue, 23 Feb 2021 12:13:44 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Feb 2021 12:13:43 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 23 Feb 2021 12:13:43 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
CC:     <linux-watchdog@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH] docs: watchdog: fix obsolete include file reference in pcwd
Date:   Tue, 23 Feb 2021 12:13:24 +0100
Message-ID: <20210223111324.309285-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F18.6034E368.004B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The file linux/pcwd.h is not more present in the kernel
sources. Its information is now moved into the file:

include/uapi/linux/watchdog.h

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 Documentation/watchdog/pcwd-watchdog.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/watchdog/pcwd-watchdog.rst b/Documentation/watchdog/pcwd-watchdog.rst
index 405e2a370082..151505c856f6 100644
--- a/Documentation/watchdog/pcwd-watchdog.rst
+++ b/Documentation/watchdog/pcwd-watchdog.rst
@@ -47,7 +47,7 @@ Documentation and Driver by Ken Hollis <kenji@bitgate.com>
 	WDIOC_GETSTATUS
 		This returns the status of the card, with the bits of
 		WDIOF_* bitwise-anded into the value.  (The comments
-		are in linux/pcwd.h)
+		are in include/uapi/linux/watchdog.h)
 
 	WDIOC_GETBOOTSTATUS
 		This returns the status of the card that was reported
-- 
2.25.1

