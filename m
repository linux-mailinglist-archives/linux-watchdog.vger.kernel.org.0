Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80027AD8BA
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Sep 2023 15:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjIYNQk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Sep 2023 09:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbjIYNQi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Sep 2023 09:16:38 -0400
X-Greylist: delayed 403 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Sep 2023 06:16:31 PDT
Received: from srv.wefi.net (srv.wefi.net [80.66.63.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E8C6A11B
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Sep 2023 06:16:31 -0700 (PDT)
Received: from [10.1.199.83] (unknown [91.223.201.11])
        by srv.wefi.net (Postfix) with ESMTPSA id 710C25A3586;
        Mon, 25 Sep 2023 15:09:47 +0200 (CEST)
Message-ID: <3bc0a1c2d768b23a0cd6e9f5fa0c0b5577427668.camel@wefi.net>
Subject: [PATCH] watchdog: it87_wdt: add IT8613 ID
From:   Werner Fischer <devlists@wefi.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Date:   Mon, 25 Sep 2023 15:09:46 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch adds watchdog support for the ITE IT8613 watchdog.
IT8613 watchdog works in the same way as the other watchdogs supported
by it87_wdt.

Before this patch, IT8613 watchdog is not supported. After a modprobe,
dmesg reports:
  it87_wdt: Unknown Chip found, Chip 8613 Revision 000c
With this patch, modprobe it87_wdt recognizes the watchdog as the dmesg
output shows:
  it87_wdt: Chip IT8613 revision 12 initialized. timeout=60 sec (nowayout=0 testmode=0)

Watchdog tests on a LES v4 have been successful, the watchdog works as
expected with this patch [1].

[1] https://www.thomas-krenn.com/en/wiki/Watchdog#LES_v4

Signed-off-by: Werner Fischer <devlists@wefi.net>
---

--- a/drivers/watchdog/it87_wdt.c	2023-09-25 15:03:52.986033681 +0200
+++ b/drivers/watchdog/it87_wdt.c	2023-09-25 15:03:36.046415573 +0200
@@ -13,9 +13,9 @@
  *		    http://www.ite.com.tw/
  *
  *	Support of the watchdog timers, which are available on
- *	IT8607, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665, IT8686,
- *	IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726, IT8728,
- *	IT8772, IT8783 and IT8784.
+ *	IT8607, IT8613, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665,
+ *	IT8686, IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726,
+ *	IT8728, IT8772, IT8783 and IT8784.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -50,6 +50,7 @@
 /* Chip Id numbers */
 #define NO_DEV_ID	0xffff
 #define IT8607_ID	0x8607
+#define IT8613_ID	0x8613
 #define IT8620_ID	0x8620
 #define IT8622_ID	0x8622
 #define IT8625_ID	0x8625
@@ -277,6 +278,7 @@
 		max_units = 65535;
 		break;
 	case IT8607_ID:
+	case IT8613_ID:
 	case IT8620_ID:
 	case IT8622_ID:
 	case IT8625_ID:

