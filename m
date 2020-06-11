Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138E71F6DD6
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jun 2020 21:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgFKTSA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jun 2020 15:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgFKTR6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jun 2020 15:17:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110E6C08C5C5
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jun 2020 12:17:58 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1jjSi1-0002Ix-GI; Thu, 11 Jun 2020 21:17:53 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1jjSi0-0000y6-NN; Thu, 11 Jun 2020 21:17:52 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] docs: watchdog: codify ident.options as superset of possible status flags
Date:   Thu, 11 Jun 2020 21:17:42 +0200
Message-Id: <20200611191750.28096-2-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200611191750.28096-1-a.fatoum@pengutronix.de>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The FIXME comment has been in-tree since the very first git commit.
The described behavior has been since relied on by some userspace, e.g.
the util-linux wdctl command and has been ignored by some kernelspace,
like the f71808e_wdt driver.

The functionality is useful to have to be able to differentiate between a
driver that doesn't support WDIOF_CARDRESET and one that does, but hasn't
had a watchdog reset, thus drop the FIXME to encourage drivers adopting
this convention.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/watchdog/watchdog-api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index c6c1e9fa9f73..800dcd7586f2 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -168,7 +168,7 @@ the fields returned in the ident struct are:
 
 the options field can have the following bits set, and describes what
 kind of information that the GET_STATUS and GET_BOOT_STATUS ioctls can
-return.   [FIXME -- Is this correct?]
+return.
 
 	================	=========================
 	WDIOF_OVERHEAT		Reset due to CPU overheat
-- 
2.27.0

