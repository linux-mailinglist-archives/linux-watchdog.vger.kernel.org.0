Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FADD25E33C
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Sep 2020 23:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgIDVRd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Sep 2020 17:17:33 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:51421 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726842AbgIDVR3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Sep 2020 17:17:29 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 3251B82C;
        Fri,  4 Sep 2020 17:17:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 04 Sep 2020 17:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        open-music-kontrollers.ch; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=fm3; bh=eQUe86eNCiQm6
        zHVPM677yACzcfXLwswpq3OYYY+D+o=; b=RJulKBc2K29KUmqcWNOGpLT8tquiP
        FrfQn35j4r/dacU3Xqr4Il6qul/UPQwWVRHg5m8r0JYM4QyTzjwWDpjWlHMavByE
        /hKHqDGxlxFXhI7EaQV50F8Zj7QyGaLB5OpF+eVPRe7DCeLMXCLaEj4mJfk9A83a
        RNgpobRtr/KDtvBJJjDlhEmeqD2pINbEroP9z2b6vEAvXjdrOtHYnvMBa4Q/OEvE
        tB71QMzVIJnMIXf8HSgk8unh2TejiDWtUa/IB4/CcqjKOAAOQbQyiQHxEQ+BMi25
        /Wrct+smNyQtjNq4gHQQXUiP4jS2W7Nshwpf91YorGna0LNIPUKBlUjOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eQUe86eNCiQm6zHVP
        M677yACzcfXLwswpq3OYYY+D+o=; b=DY8qkmRIgP9AhPlXoEuMaHnQD9skfwxD+
        V6lavFWIAlBrrDu8xYNvZBvNZuPTZdj2gy5LcEJTSCuTmzxCFzz6ii2Xhqcl9Q+e
        GvnOSOGyCwtOi7YXsTIHi/gGMS/r4OFFreWyGoJFV3z54KKPCF1RGu4YC+29Ogxc
        Xjen1STWQ+j9Myt756oVHGIjLHGPwKOQX9qYFuJsNmZY8uZPbujxGn6L5KuJPohD
        vNmEPA1tduN7mO76AVbtIK2lbov2ilgi9uFpsyEMaelB5aDsUL7HVI6d2ZEH51KO
        9IK8vDfi5Te5b4rkN49EF1p9/kBQtRMNPJX8IW9EqyY8GC5hR4ftA==
X-ME-Sender: <xms:5a5SX2YKmAuKYbs46NiifvJJUvX7uEeK50IXGZ7fzpwr3hNbNjXVxw>
    <xme:5a5SX5YtEttwsjVGwJvqFOxk-5tI1uauh2GwJEnVlKrALZH-LcTZTlZddUSfBP7JU
    D8A0UhktbaSJRo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegfedgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefjrghnshhpvghtvghrucfrohhrthhnvghruceouggvvhesohhp
    vghnqdhmuhhsihgtqdhkohhnthhrohhllhgvrhhsrdgthheqnecuggftrfgrthhtvghrnh
    epvdehueelieeivefghffhtdehleffieefudduhfegkeetheevgfdthfelieekgeeinecu
    kfhppeegiedruddvjedruddtledrieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpeguvghvsehophgvnhdqmhhushhitgdqkhhonhhtrhholhhl
    vghrshdrtghh
X-ME-Proxy: <xmx:5a5SXw-FWq0DlRMkfRsW96aTNk_Qj0h7AIMvo_pwg1rbO0EkAX240A>
    <xmx:5a5SX4qNzRM6M-s1D0Ej0Mm-KtzJpZOjJg5Mh_KcNiO-FykU0iiZkQ>
    <xmx:5a5SXxoEK38cW1Ls0dDOUjFgYA7umVisFl0HyrDl_y1VVXh0G3qSKQ>
    <xmx:5q5SXyAAsX4SBQQZy90FhV6KctawfWU1wpjA6HO9AmB4cp5OxRM3kw>
Received: from localhost.localdomain (46-127-109-6.dynamic.hispeed.ch [46.127.109.6])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1336A306005E;
        Fri,  4 Sep 2020 17:17:24 -0400 (EDT)
From:   Hanspeter Portner <dev@open-music-kontrollers.ch>
To:     wim@linux-watchdog.org
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        dev@open-music-kontrollers.ch
Subject: [PATCH 1/2] watchdog: it87_wdt: add IT8772 ID
Date:   Fri,  4 Sep 2020 23:16:38 +0200
Message-Id: <20200904211639.18787-1-dev@open-music-kontrollers.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

IT8772 watchdog works as in IT872x

Tested on SHAREVDI K6-F12 board.

Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/it87_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index f3bf3ea50e39..2dac0ba551ce 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -15,7 +15,7 @@
  *	Support of the watchdog timers, which are available on
  *	IT8607, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665, IT8686,
  *	IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726, IT8728,
- *	and IT8783.
+ *	IT8772 and IT8783.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -66,6 +66,7 @@
 #define IT8721_ID	0x8721
 #define IT8726_ID	0x8726	/* the data sheet suggest wrongly 0x8716 */
 #define IT8728_ID	0x8728
+#define IT8772_ID	0x8772
 #define IT8783_ID	0x8783
 #define IT8786_ID	0x8786
 
@@ -294,6 +295,7 @@ static int __init it87_wdt_init(void)
 	case IT8720_ID:
 	case IT8721_ID:
 	case IT8728_ID:
+	case IT8772_ID:
 	case IT8783_ID:
 	case IT8786_ID:
 		max_units = 65535;
-- 
2.28.0

