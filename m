Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744E62174B5
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jul 2020 19:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgGGRF4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jul 2020 13:05:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:50334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgGGRF4 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jul 2020 13:05:56 -0400
Received: from embeddedor (unknown [200.39.26.250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AFE420738;
        Tue,  7 Jul 2020 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594141555;
        bh=6P8AQjZsw2rWcd5VxBUc/vKoLIY3ZeAMqgyJ7FSaYqA=;
        h=Date:From:To:Cc:Subject:From;
        b=uQATyXe3hE6SK6n4/LAtPRCiIyNIRNk5bsrLIHt2HWP/wF1QitnRHAwjjI813G1+2
         endwOhSZxhESYS6ZG11QGOLKpUzq4jurnRsX0oyhNs0LJYw98eopWHlmnt8ICY5Ax1
         IfeKbuvoq1W8c2f4W1ugRcWePDIhB5y2GboMSEoA=
Date:   Tue, 7 Jul 2020 12:11:21 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] watchdog: Use fallthrough pseudo-keyword
Message-ID: <20200707171121.GA13472@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/watchdog/advantechwdt.c   |    2 +-
 drivers/watchdog/alim1535_wdt.c   |    2 +-
 drivers/watchdog/alim7101_wdt.c   |    2 +-
 drivers/watchdog/ar7_wdt.c        |    3 +--
 drivers/watchdog/ath79_wdt.c      |    2 +-
 drivers/watchdog/eurotechwdt.c    |    2 +-
 drivers/watchdog/f71808e_wdt.c    |    4 ++--
 drivers/watchdog/gef_wdt.c        |    2 +-
 drivers/watchdog/geodewdt.c       |    2 +-
 drivers/watchdog/ib700wdt.c       |    2 +-
 drivers/watchdog/it8712f_wdt.c    |    2 +-
 drivers/watchdog/ixp4xx_wdt.c     |    2 +-
 drivers/watchdog/m54xx_wdt.c      |    2 +-
 drivers/watchdog/machzwd.c        |    2 +-
 drivers/watchdog/mv64x60_wdt.c    |    2 +-
 drivers/watchdog/nv_tco.c         |    2 +-
 drivers/watchdog/pc87413_wdt.c    |    2 +-
 drivers/watchdog/pcwd.c           |    2 +-
 drivers/watchdog/pcwd_pci.c       |    2 +-
 drivers/watchdog/pcwd_usb.c       |    2 +-
 drivers/watchdog/rc32434_wdt.c    |    2 +-
 drivers/watchdog/riowd.c          |    2 +-
 drivers/watchdog/sa1100_wdt.c     |    2 +-
 drivers/watchdog/sb_wdog.c        |    2 +-
 drivers/watchdog/sbc60xxwdt.c     |    2 +-
 drivers/watchdog/sbc7240_wdt.c    |    2 +-
 drivers/watchdog/sbc_fitpc2_wdt.c |    2 +-
 drivers/watchdog/sc520_wdt.c      |    2 +-
 drivers/watchdog/sch311x_wdt.c    |    2 +-
 drivers/watchdog/smsc37b787_wdt.c |    2 +-
 drivers/watchdog/w83877f_wdt.c    |    2 +-
 drivers/watchdog/w83977f_wdt.c    |    2 +-
 drivers/watchdog/wafer5823wdt.c   |    2 +-
 drivers/watchdog/watchdog_dev.c   |    2 +-
 drivers/watchdog/wdt.c            |    2 +-
 drivers/watchdog/wdt285.c         |    2 +-
 drivers/watchdog/wdt977.c         |    2 +-
 drivers/watchdog/wdt_pci.c        |    2 +-
 38 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/watchdog/advantechwdt.c b/drivers/watchdog/advantechwdt.c
index 0e4c18a2aa42..554fe85da50e 100644
--- a/drivers/watchdog/advantechwdt.c
+++ b/drivers/watchdog/advantechwdt.c
@@ -177,7 +177,7 @@ static long advwdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (advwdt_set_heartbeat(new_timeout))
 			return -EINVAL;
 		advwdt_ping();
-		/* fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 	default:
diff --git a/drivers/watchdog/alim1535_wdt.c b/drivers/watchdog/alim1535_wdt.c
index 42338c7d4540..bfb9a91ca1df 100644
--- a/drivers/watchdog/alim1535_wdt.c
+++ b/drivers/watchdog/alim1535_wdt.c
@@ -220,7 +220,7 @@ static long ali_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			return -EINVAL;
 		ali_keepalive();
 	}
-		/* fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 	default:
diff --git a/drivers/watchdog/alim7101_wdt.c b/drivers/watchdog/alim7101_wdt.c
index 5af0358f4390..4ff7f5afb7aa 100644
--- a/drivers/watchdog/alim7101_wdt.c
+++ b/drivers/watchdog/alim7101_wdt.c
@@ -279,7 +279,7 @@ static long fop_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		timeout = new_timeout;
 		wdt_keepalive();
 	}
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 	default:
diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
index c087027ffd5d..ff37dc91057d 100644
--- a/drivers/watchdog/ar7_wdt.c
+++ b/drivers/watchdog/ar7_wdt.c
@@ -235,8 +235,7 @@ static long ar7_wdt_ioctl(struct file *file,
 		ar7_wdt_update_margin(new_margin);
 		ar7_wdt_kick(1);
 		spin_unlock(&wdt_lock);
-		/* Fall through */
-
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		if (put_user(margin, (int *)arg))
 			return -EFAULT;
diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index d6dff97c280b..0f18f06a21b6 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -215,8 +215,8 @@ static long ath79_wdt_ioctl(struct file *file, unsigned int cmd,
 		err = ath79_wdt_set_timeout(t);
 		if (err)
 			break;
+		fallthrough;
 
-		/* fallthrough */
 	case WDIOC_GETTIMEOUT:
 		err = put_user(timeout, p);
 		break;
diff --git a/drivers/watchdog/eurotechwdt.c b/drivers/watchdog/eurotechwdt.c
index f5ffa7be066e..2418ebb707bd 100644
--- a/drivers/watchdog/eurotechwdt.c
+++ b/drivers/watchdog/eurotechwdt.c
@@ -286,7 +286,7 @@ static long eurwdt_ioctl(struct file *file,
 		eurwdt_timeout = time;
 		eurwdt_set_timeout(time);
 		spin_unlock(&eurwdt_lock);
-		/* fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(eurwdt_timeout, p);
diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index a3c44d75d80e..d7a00e678b9a 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -629,7 +629,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 
 		if (new_options & WDIOS_ENABLECARD)
 			return watchdog_start();
-		/* fall through */
+		fallthrough;
 
 	case WDIOC_KEEPALIVE:
 		watchdog_keepalive();
@@ -643,7 +643,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 			return -EINVAL;
 
 		watchdog_keepalive();
-		/* fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(watchdog.timeout, uarg.i);
diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
index f6541d1b65e3..df5406aa7d25 100644
--- a/drivers/watchdog/gef_wdt.c
+++ b/drivers/watchdog/gef_wdt.c
@@ -201,7 +201,7 @@ static long gef_wdt_ioctl(struct file *file, unsigned int cmd,
 		if (get_user(timeout, (int __user *)argp))
 			return -EFAULT;
 		gef_wdt_set_timeout(timeout);
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		if (put_user(gef_wdt_timeout, (int __user *)argp))
diff --git a/drivers/watchdog/geodewdt.c b/drivers/watchdog/geodewdt.c
index 9914a4283cb2..83418924e30a 100644
--- a/drivers/watchdog/geodewdt.c
+++ b/drivers/watchdog/geodewdt.c
@@ -185,7 +185,7 @@ static long geodewdt_ioctl(struct file *file, unsigned int cmd,
 
 		if (geodewdt_set_heartbeat(interval))
 			return -EINVAL;
-	/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 
diff --git a/drivers/watchdog/ib700wdt.c b/drivers/watchdog/ib700wdt.c
index 2b65ea9451d1..a0ddedc362fc 100644
--- a/drivers/watchdog/ib700wdt.c
+++ b/drivers/watchdog/ib700wdt.c
@@ -214,7 +214,7 @@ static long ibwdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (ibwdt_set_heartbeat(new_margin))
 			return -EINVAL;
 		ibwdt_ping();
-		/* fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
diff --git a/drivers/watchdog/it8712f_wdt.c b/drivers/watchdog/it8712f_wdt.c
index 2fed40d14007..9b89d2f09568 100644
--- a/drivers/watchdog/it8712f_wdt.c
+++ b/drivers/watchdog/it8712f_wdt.c
@@ -303,7 +303,7 @@ static long it8712f_wdt_ioctl(struct file *file, unsigned int cmd,
 
 		superio_exit();
 		it8712f_wdt_ping();
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		if (put_user(margin, p))
 			return -EFAULT;
diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
index 09886616fd21..aae29dcfaf11 100644
--- a/drivers/watchdog/ixp4xx_wdt.c
+++ b/drivers/watchdog/ixp4xx_wdt.c
@@ -136,7 +136,7 @@ static long ixp4xx_wdt_ioctl(struct file *file, unsigned int cmd,
 
 		heartbeat = time;
 		wdt_enable();
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		ret = put_user(heartbeat, (int *)arg);
diff --git a/drivers/watchdog/m54xx_wdt.c b/drivers/watchdog/m54xx_wdt.c
index 60ed6252e5f4..f388a769dbd3 100644
--- a/drivers/watchdog/m54xx_wdt.c
+++ b/drivers/watchdog/m54xx_wdt.c
@@ -155,7 +155,7 @@ static long m54xx_wdt_ioctl(struct file *file, unsigned int cmd,
 
 		heartbeat = time;
 		wdt_enable();
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		ret = put_user(heartbeat, (int *)arg);
diff --git a/drivers/watchdog/machzwd.c b/drivers/watchdog/machzwd.c
index 80ff94688487..743377c5b173 100644
--- a/drivers/watchdog/machzwd.c
+++ b/drivers/watchdog/machzwd.c
@@ -171,7 +171,7 @@ static inline void zf_set_timer(unsigned short new, unsigned char n)
 	switch (n) {
 	case WD1:
 		zf_writew(COUNTER_1, new);
-		/* fall through */
+		fallthrough;
 	case WD2:
 		zf_writeb(COUNTER_2, new > 0xff ? 0xff : new);
 	default:
diff --git a/drivers/watchdog/mv64x60_wdt.c b/drivers/watchdog/mv64x60_wdt.c
index 0bc72dd69b70..894aa63488d3 100644
--- a/drivers/watchdog/mv64x60_wdt.c
+++ b/drivers/watchdog/mv64x60_wdt.c
@@ -222,7 +222,7 @@ static long mv64x60_wdt_ioctl(struct file *file,
 		if (get_user(timeout, (int __user *)argp))
 			return -EFAULT;
 		mv64x60_wdt_set_timeout(timeout);
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		if (put_user(mv64x60_wdt_timeout, (int __user *)argp))
diff --git a/drivers/watchdog/nv_tco.c b/drivers/watchdog/nv_tco.c
index d7a560e348d5..d15ad8583a59 100644
--- a/drivers/watchdog/nv_tco.c
+++ b/drivers/watchdog/nv_tco.c
@@ -250,7 +250,7 @@ static long nv_tco_ioctl(struct file *file, unsigned int cmd,
 		if (tco_timer_set_heartbeat(new_heartbeat))
 			return -EINVAL;
 		tco_timer_keepalive();
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(heartbeat, p);
 	default:
diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
index 73fbfc99083b..2d4504302c9e 100644
--- a/drivers/watchdog/pc87413_wdt.c
+++ b/drivers/watchdog/pc87413_wdt.c
@@ -433,7 +433,7 @@ static long pc87413_ioctl(struct file *file, unsigned int cmd,
 			return -EINVAL;
 		timeout = new_timeout;
 		pc87413_refresh();
-		/* fall through - and return the new timeout... */
+		fallthrough;	/* and return the new timeout */
 	case WDIOC_GETTIMEOUT:
 		new_timeout = timeout * 60;
 		return put_user(new_timeout, uarg.i);
diff --git a/drivers/watchdog/pcwd.c b/drivers/watchdog/pcwd.c
index 7a0587fdc52c..e86fa7f8351d 100644
--- a/drivers/watchdog/pcwd.c
+++ b/drivers/watchdog/pcwd.c
@@ -651,7 +651,7 @@ static long pcwd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			return -EINVAL;
 
 		pcwd_keepalive();
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(heartbeat, argp);
diff --git a/drivers/watchdog/pcwd_pci.c b/drivers/watchdog/pcwd_pci.c
index 81508a42a90c..54d86fcb1837 100644
--- a/drivers/watchdog/pcwd_pci.c
+++ b/drivers/watchdog/pcwd_pci.c
@@ -542,7 +542,7 @@ static long pcipcwd_ioctl(struct file *file, unsigned int cmd,
 
 		pcipcwd_keepalive();
 	}
-		/* fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(heartbeat, p);
diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index 2f44af1831d0..79efca47cebb 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -452,7 +452,7 @@ static long usb_pcwd_ioctl(struct file *file, unsigned int cmd,
 
 		usb_pcwd_keepalive(usb_pcwd_device);
 	}
-		/* fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(heartbeat, p);
diff --git a/drivers/watchdog/rc32434_wdt.c b/drivers/watchdog/rc32434_wdt.c
index aee3c2efd565..e74802f3a32e 100644
--- a/drivers/watchdog/rc32434_wdt.c
+++ b/drivers/watchdog/rc32434_wdt.c
@@ -230,7 +230,7 @@ static long rc32434_wdt_ioctl(struct file *file, unsigned int cmd,
 			return -EFAULT;
 		if (rc32434_wdt_set(new_timeout))
 			return -EINVAL;
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return copy_to_user(argp, &timeout, sizeof(int)) ? -EFAULT : 0;
 	default:
diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
index 1b9a6dc8f982..7008596a575f 100644
--- a/drivers/watchdog/riowd.c
+++ b/drivers/watchdog/riowd.c
@@ -134,7 +134,7 @@ static long riowd_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			return -EINVAL;
 		riowd_timeout = (new_margin + 59) / 60;
 		riowd_writereg(p, riowd_timeout, WDTO_INDEX);
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(riowd_timeout * 60, (int __user *)argp);
diff --git a/drivers/watchdog/sa1100_wdt.c b/drivers/watchdog/sa1100_wdt.c
index 9b93be00109f..27846c6bdfb0 100644
--- a/drivers/watchdog/sa1100_wdt.c
+++ b/drivers/watchdog/sa1100_wdt.c
@@ -127,7 +127,7 @@ static long sa1100dog_ioctl(struct file *file, unsigned int cmd,
 
 		pre_margin = oscr_freq * time;
 		writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
-		/*fall through*/
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		ret = put_user(pre_margin / oscr_freq, p);
diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
index da2dad00d473..504be461f992 100644
--- a/drivers/watchdog/sb_wdog.c
+++ b/drivers/watchdog/sb_wdog.c
@@ -202,7 +202,7 @@ static long sbwdog_ioctl(struct file *file, unsigned int cmd,
 		timeout = time;
 		sbwdog_set(user_dog, timeout);
 		sbwdog_pet(user_dog);
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		/*
diff --git a/drivers/watchdog/sbc60xxwdt.c b/drivers/watchdog/sbc60xxwdt.c
index f2cbe6d880a8..a947a63fb44a 100644
--- a/drivers/watchdog/sbc60xxwdt.c
+++ b/drivers/watchdog/sbc60xxwdt.c
@@ -265,7 +265,7 @@ static long fop_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		timeout = new_timeout;
 		wdt_keepalive();
 	}
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 	default:
diff --git a/drivers/watchdog/sbc7240_wdt.c b/drivers/watchdog/sbc7240_wdt.c
index 520b8dd77ed4..d640b26e18a6 100644
--- a/drivers/watchdog/sbc7240_wdt.c
+++ b/drivers/watchdog/sbc7240_wdt.c
@@ -195,7 +195,7 @@ static long fop_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (wdt_set_timeout(new_timeout))
 			return -EINVAL;
 	}
-	/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, (int __user *)arg);
 	default:
diff --git a/drivers/watchdog/sbc_fitpc2_wdt.c b/drivers/watchdog/sbc_fitpc2_wdt.c
index 1b20b33879c4..04483d6453d6 100644
--- a/drivers/watchdog/sbc_fitpc2_wdt.c
+++ b/drivers/watchdog/sbc_fitpc2_wdt.c
@@ -154,7 +154,7 @@ static long fitpc2_wdt_ioctl(struct file *file, unsigned int cmd,
 
 		margin = time;
 		wdt_enable();
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		ret = put_user(margin, (int *)arg);
diff --git a/drivers/watchdog/sc520_wdt.c b/drivers/watchdog/sc520_wdt.c
index fbe79bcc9297..e66e6b905964 100644
--- a/drivers/watchdog/sc520_wdt.c
+++ b/drivers/watchdog/sc520_wdt.c
@@ -321,7 +321,7 @@ static long fop_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		wdt_keepalive();
 	}
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 	default:
diff --git a/drivers/watchdog/sch311x_wdt.c b/drivers/watchdog/sch311x_wdt.c
index 83949a385f62..d8b77fe10eba 100644
--- a/drivers/watchdog/sch311x_wdt.c
+++ b/drivers/watchdog/sch311x_wdt.c
@@ -295,7 +295,7 @@ static long sch311x_wdt_ioctl(struct file *file, unsigned int cmd,
 		if (sch311x_wdt_set_heartbeat(new_timeout))
 			return -EINVAL;
 		sch311x_wdt_keepalive();
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 	default:
diff --git a/drivers/watchdog/smsc37b787_wdt.c b/drivers/watchdog/smsc37b787_wdt.c
index 43de56acd767..7463df479d11 100644
--- a/drivers/watchdog/smsc37b787_wdt.c
+++ b/drivers/watchdog/smsc37b787_wdt.c
@@ -474,7 +474,7 @@ static long wb_smsc_wdt_ioctl(struct file *file,
 			return -EINVAL;
 		timeout = new_timeout;
 		wb_smsc_wdt_set_timeout(timeout);
-		/* fall through - and return the new timeout... */
+		fallthrough;	/* and return the new timeout */
 	case WDIOC_GETTIMEOUT:
 		new_timeout = timeout;
 		if (unit == UNIT_MINUTE)
diff --git a/drivers/watchdog/w83877f_wdt.c b/drivers/watchdog/w83877f_wdt.c
index 6b3b667e6f23..5772cc5d3780 100644
--- a/drivers/watchdog/w83877f_wdt.c
+++ b/drivers/watchdog/w83877f_wdt.c
@@ -289,7 +289,7 @@ static long fop_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		timeout = new_timeout;
 		wdt_keepalive();
 	}
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 	default:
diff --git a/drivers/watchdog/w83977f_wdt.c b/drivers/watchdog/w83977f_wdt.c
index 5212e68c6b01..fd64ae77780a 100644
--- a/drivers/watchdog/w83977f_wdt.c
+++ b/drivers/watchdog/w83977f_wdt.c
@@ -422,7 +422,7 @@ static long wdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			return -EINVAL;
 
 		wdt_keepalive();
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, uarg.i);
diff --git a/drivers/watchdog/wafer5823wdt.c b/drivers/watchdog/wafer5823wdt.c
index a6925847f76f..a8a1ed215e1e 100644
--- a/drivers/watchdog/wafer5823wdt.c
+++ b/drivers/watchdog/wafer5823wdt.c
@@ -174,7 +174,7 @@ static long wafwdt_ioctl(struct file *file, unsigned int cmd,
 		timeout = new_timeout;
 		wafwdt_stop();
 		wafwdt_start();
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, p);
 
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 7e4cd34a8c20..0c9c50f0f5eb 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -776,7 +776,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 		err = watchdog_ping(wdd);
 		if (err < 0)
 			break;
-		/* fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		/* timeout == 0 means that we don't know the timeout */
 		if (wdd->timeout == 0) {
diff --git a/drivers/watchdog/wdt.c b/drivers/watchdog/wdt.c
index f9054cb0f8e2..a9e40b5c633e 100644
--- a/drivers/watchdog/wdt.c
+++ b/drivers/watchdog/wdt.c
@@ -389,7 +389,7 @@ static long wdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (wdt_set_heartbeat(new_heartbeat))
 			return -EINVAL;
 		wdt_ping();
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(heartbeat, p);
 	default:
diff --git a/drivers/watchdog/wdt285.c b/drivers/watchdog/wdt285.c
index e60993d0767e..110249e5f642 100644
--- a/drivers/watchdog/wdt285.c
+++ b/drivers/watchdog/wdt285.c
@@ -168,7 +168,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 		soft_margin = new_margin;
 		reload = soft_margin * (mem_fclk_21285 / 256);
 		watchdog_ping();
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		ret = put_user(soft_margin, int_arg);
 		break;
diff --git a/drivers/watchdog/wdt977.c b/drivers/watchdog/wdt977.c
index 066a4fb4d75b..c9b8e863f70f 100644
--- a/drivers/watchdog/wdt977.c
+++ b/drivers/watchdog/wdt977.c
@@ -398,7 +398,7 @@ static long wdt977_ioctl(struct file *file, unsigned int cmd,
 			return -EINVAL;
 
 		wdt977_keepalive();
-		/* Fall through */
+		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, uarg.i);
diff --git a/drivers/watchdog/wdt_pci.c b/drivers/watchdog/wdt_pci.c
index e528024faa41..c3254ba5ace6 100644
--- a/drivers/watchdog/wdt_pci.c
+++ b/drivers/watchdog/wdt_pci.c
@@ -426,7 +426,7 @@ static long wdtpci_ioctl(struct file *file, unsigned int cmd,
 		if (wdtpci_set_heartbeat(new_heartbeat))
 			return -EINVAL;
 		wdtpci_ping();
-		/* fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		return put_user(heartbeat, p);
 	default:

