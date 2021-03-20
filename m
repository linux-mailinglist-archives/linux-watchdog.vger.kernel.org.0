Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68717342CB0
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Mar 2021 13:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCTMH7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Mar 2021 08:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhCTMH0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Mar 2021 08:07:26 -0400
X-Greylist: delayed 4501 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 20 Mar 2021 05:07:26 PDT
Received: from www381.your-server.de (www381.your-server.de [IPv6:2a01:4f8:d0a:52ac::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7654EC061762
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Mar 2021 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=wvNbq4eGmrEClB23uYXocVcSkMlM7/VzMDExaGNhnzM=; b=HvYEmgVY1rDE5wbm6NWa9XrBCH
        h+Mu/sEfkRE0A9kVuMOpSVwEEkS8q28E9rZqrZZBwzSFWTk9wxaGtA3XJz3t84WJXlld8uJOXi/j4
        zZMMq+8A9rdzQdG8iDWvhGJMigeTZ6m3l3+5fqBd0E5j0ZG0cP3sapQrWOCcFDcB/dWLabfDTq2V9
        6COAONaAK2DGkfD7EKXYODWNe4+/6yy+y70mgybEBiOk/ru15pFApRnA1UXi6HHPfNC96oEor4tVw
        T84pz0WxqHvSDj2+OU6xkZ/v3+kNphxvIat736QhuCYtX+8SD6z6ocQFckH4t32btjNgaFJU5LOoR
        v2EBrjvA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1lNWzx-0007mm-F5; Sat, 20 Mar 2021 09:30:17 +0100
Received: from [2001:a61:2aa9:e001:9e5c:8eff:fe01:8578] (helo=lars-desktop.fritz.box)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1lNWzx-000VD2-9z; Sat, 20 Mar 2021 09:30:17 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        enjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-watchdog@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] watchdog: Use DIV_ROUND_UP() instead of open-coding it
Date:   Sat, 20 Mar 2021 09:29:56 +0100
Message-Id: <20210320082956.27689-1-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26114/Sat Mar 20 04:43:32 2021)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use DIV_ROUND_UP() instead of open-coding it. This makes it more clear
what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@r1@
expression x;
constant C1;
constant C2;
@@
 ((x) + C1) / C2

@script:python@
C1 << r1.C1;
C2 << r1.C2;
@@
print C1, C2
try:
	if int(C1) != int(C2) - 1 or int(C1) == 1:
		cocci.include_match(False)
except:
	cocci.include_match(False)

@@
expression r1.x;
constant r1.C1;
constant r1.C2;
@@
-(((x) + C1) / C2)
+DIV_ROUND_UP(x, C2)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/watchdog/riowd.c       | 2 +-
 drivers/watchdog/w83977f_wdt.c | 2 +-
 drivers/watchdog/wdrtas.c      | 2 +-
 drivers/watchdog/wdt977.c      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
index 7008596a575f..aa8a929505b5 100644
--- a/drivers/watchdog/riowd.c
+++ b/drivers/watchdog/riowd.c
@@ -132,7 +132,7 @@ static long riowd_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			return -EFAULT;
 		if ((new_margin < 60) || (new_margin > (255 * 60)))
 			return -EINVAL;
-		riowd_timeout = (new_margin + 59) / 60;
+		riowd_timeout = DIV_ROUND_UP(new_margin, 60);
 		riowd_writereg(p, riowd_timeout, WDTO_INDEX);
 		fallthrough;
 
diff --git a/drivers/watchdog/w83977f_wdt.c b/drivers/watchdog/w83977f_wdt.c
index fd64ae77780a..fbc31c4a1e0b 100644
--- a/drivers/watchdog/w83977f_wdt.c
+++ b/drivers/watchdog/w83977f_wdt.c
@@ -231,7 +231,7 @@ static int wdt_set_timeout(int t)
 	if (t < 15)
 		return -EINVAL;
 
-	tmrval = ((t + 15) + 29) / 30;
+	tmrval = DIV_ROUND_UP(t + 15, 30);
 
 	if (tmrval > 255)
 		return -EINVAL;
diff --git a/drivers/watchdog/wdrtas.c b/drivers/watchdog/wdrtas.c
index c00627825de8..0c21ee535a74 100644
--- a/drivers/watchdog/wdrtas.c
+++ b/drivers/watchdog/wdrtas.c
@@ -75,7 +75,7 @@ static int wdrtas_set_interval(int interval)
 	static int print_msg = 10;
 
 	/* rtas uses minutes */
-	interval = (interval + 59) / 60;
+	interval = DIV_ROUND_UP(interval, 60);
 
 	result = rtas_call(wdrtas_token_set_indicator, 3, 1, NULL,
 			   WDRTAS_SURVEILLANCE_IND, 0, interval);
diff --git a/drivers/watchdog/wdt977.c b/drivers/watchdog/wdt977.c
index c9b8e863f70f..7cff1300be3e 100644
--- a/drivers/watchdog/wdt977.c
+++ b/drivers/watchdog/wdt977.c
@@ -201,7 +201,7 @@ static int wdt977_set_timeout(int t)
 	int tmrval;
 
 	/* convert seconds to minutes, rounding up */
-	tmrval = (t + 59) / 60;
+	tmrval = DIV_ROUND_UP(t, 60);
 
 	if (machine_is_netwinder()) {
 		/* we have a hw bug somewhere, so each 977 minute is actually
-- 
2.20.1

