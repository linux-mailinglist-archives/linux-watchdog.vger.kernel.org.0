Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40A21C262B
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 May 2020 16:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgEBObK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 May 2020 10:31:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:33496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbgEBObJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 May 2020 10:31:09 -0400
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 298E221974;
        Sat,  2 May 2020 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588429868;
        bh=ZrAFb3EFm0aBHGZPXOEtp+VMMdo/srHm617ZzF2qCjY=;
        h=From:To:Cc:Subject:Date:From;
        b=TN08eYGsV4XhBJia3jlvzpKbzAid1zvmHD0hojXcMjmcNNVHy94RFdrbjWr9QA9qR
         GpcX3kLFa6rVmCCECC5+/REzQxoKjeJL1BuLWPHIy84FnYxdpP+lsGmVsoLGoVe9eP
         CEa4fIDZMoCyfaAFWzFQIOzNRQIBTbgiXHNzgB0Y=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] watchdog: update email address in conversion doc
Date:   Sat,  2 May 2020 16:30:58 +0200
Message-Id: <20200502143103.19473-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The old one is defunct. However, I think it makes sense that I am still
the primary contact person for updates here.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

... if there will be any. Let me know if you agree.

 Documentation/watchdog/convert_drivers_to_kernel_api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/watchdog/convert_drivers_to_kernel_api.rst b/Documentation/watchdog/convert_drivers_to_kernel_api.rst
index dd934cc08e40..b972ef4c7cff 100644
--- a/Documentation/watchdog/convert_drivers_to_kernel_api.rst
+++ b/Documentation/watchdog/convert_drivers_to_kernel_api.rst
@@ -2,7 +2,7 @@
 Converting old watchdog drivers to the watchdog framework
 =========================================================
 
-by Wolfram Sang <w.sang@pengutronix.de>
+by Wolfram Sang <wsa@kernel.org>
 
 Before the watchdog framework came into the kernel, every driver had to
 implement the API on its own. Now, as the framework factored out the common
-- 
2.20.1

