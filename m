Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B8C2981B3
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Oct 2020 13:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416031AbgJYMp0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Oct 2020 08:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1416022AbgJYMpY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Oct 2020 08:45:24 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0B8C0613CE
        for <linux-watchdog@vger.kernel.org>; Sun, 25 Oct 2020 05:45:22 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gs25so9559243ejb.1
        for <linux-watchdog@vger.kernel.org>; Sun, 25 Oct 2020 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ktBxi/1ghRm1dSb7T8JBIhiNOsB6IY3tOdDngk7/hKE=;
        b=WXJfTi729d7VXmvhTGeemJ0YNTcw6dfh+TmbiD3fd25RIvtbWoVonN0WBoy6obXwyy
         q+Z99WQlhpeIj93Oct5Aj0LZy24SrRGzaHHc/B/TW5Ig+CrRDnly6MUd8UZ7erx89CnL
         YfU1k806d3ZZVKHb476gQenT96YHSIDW5Abik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ktBxi/1ghRm1dSb7T8JBIhiNOsB6IY3tOdDngk7/hKE=;
        b=oeZHQpcKGm0BPrgr2bWzR3lYJ+RH/8NcIbRy0LuEXT1przC6SQaz+L4pCD0GO3bvEQ
         Ru2celxWz8GsdGvhLa8NPGM1mZ5iCf/xeqSiIk7xdLds2Is6LLYPBAbfueCSTIT4FrJQ
         GTXdd7MkadaHyy2eETTbnvjSC0i5x+BAqrlhMvrNvYvDFRrMlSsrUF0OWxdVexMLRicp
         7TdJil4mULlc+XWR5re9kuysrOvyWXXBtxeObGXgaBbhxaKOmY4Yrihl/1IcYyt94/dD
         HwKEaGpzJudrEyGVdgqfW4EuluS5qjlLRWZwRBphcwcnyCvySjx1PZuYytZN6CDh6Wmx
         Dbhw==
X-Gm-Message-State: AOAM533+jiNNjRYyfQmr13g2HF2IfPdDSWrizcKT88+joRX9OaTgM/9x
        lDeEZAwLRioasMhwrXoZJMpsig==
X-Google-Smtp-Source: ABdhPJwvqmujT1Epj7bVSC81w2I3vvU6p+Nw9OTqcm5qTmTYtjFyjPSl+W9jM4uzuRxjwMB2jwKHbw==
X-Received: by 2002:a17:907:206e:: with SMTP id qp14mr11019060ejb.76.1603629921202;
        Sun, 25 Oct 2020 05:45:21 -0700 (PDT)
Received: from prevas-ravi.prevas.se (5.186.115.188.cgn.fibianet.dk. [5.186.115.188])
        by smtp.gmail.com with ESMTPSA id t8sm3920954ejc.45.2020.10.25.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 05:45:20 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        kernel test robot <lkp@intel.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: sbc_fitpc2_wdt: add __user annotations
Date:   Sun, 25 Oct 2020 13:45:18 +0100
Message-Id: <20201025124518.31647-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

After a change to the put_user() macro on x86, kernel test robot has
started sending me complaints (from sparse) about passing kernel
pointers to put_user(). So add the __user annotations to the various
casts in fitpc2_wdt_ioctl(), and while in here, also make the write
method actually match the prototype of file_operations::write.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/watchdog/sbc_fitpc2_wdt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/sbc_fitpc2_wdt.c b/drivers/watchdog/sbc_fitpc2_wdt.c
index 04483d6453d6a147703e..13db71e165836eb73249 100644
--- a/drivers/watchdog/sbc_fitpc2_wdt.c
+++ b/drivers/watchdog/sbc_fitpc2_wdt.c
@@ -78,7 +78,7 @@ static int fitpc2_wdt_open(struct inode *inode, struct file *file)
 	return stream_open(inode, file);
 }
 
-static ssize_t fitpc2_wdt_write(struct file *file, const char *data,
+static ssize_t fitpc2_wdt_write(struct file *file, const char __user *data,
 						size_t len, loff_t *ppos)
 {
 	size_t i;
@@ -125,16 +125,16 @@ static long fitpc2_wdt_ioctl(struct file *file, unsigned int cmd,
 
 	switch (cmd) {
 	case WDIOC_GETSUPPORT:
-		ret = copy_to_user((struct watchdog_info *)arg, &ident,
+		ret = copy_to_user((struct watchdog_info __user *)arg, &ident,
 				   sizeof(ident)) ? -EFAULT : 0;
 		break;
 
 	case WDIOC_GETSTATUS:
-		ret = put_user(0, (int *)arg);
+		ret = put_user(0, (int __user *)arg);
 		break;
 
 	case WDIOC_GETBOOTSTATUS:
-		ret = put_user(0, (int *)arg);
+		ret = put_user(0, (int __user *)arg);
 		break;
 
 	case WDIOC_KEEPALIVE:
@@ -143,7 +143,7 @@ static long fitpc2_wdt_ioctl(struct file *file, unsigned int cmd,
 		break;
 
 	case WDIOC_SETTIMEOUT:
-		ret = get_user(time, (int *)arg);
+		ret = get_user(time, (int __user *)arg);
 		if (ret)
 			break;
 
@@ -157,7 +157,7 @@ static long fitpc2_wdt_ioctl(struct file *file, unsigned int cmd,
 		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
-		ret = put_user(margin, (int *)arg);
+		ret = put_user(margin, (int __user *)arg);
 		break;
 	}
 
-- 
2.23.0

