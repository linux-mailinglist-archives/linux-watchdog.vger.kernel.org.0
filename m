Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9882548E6
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Aug 2020 17:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgH0PPx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 Aug 2020 11:15:53 -0400
Received: from forward2-smtp.messagingengine.com ([66.111.4.226]:42323 "EHLO
        forward2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728763AbgH0Lg6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 Aug 2020 07:36:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailforward.nyi.internal (Postfix) with ESMTP id 8D6C619415F4;
        Thu, 27 Aug 2020 06:59:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 27 Aug 2020 06:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vtoyDX/IZ3XS/HSiE
        GUBNpooDdTTo0gCh1n1HFvlJ7I=; b=fiBMd+H2py1Q0+lRApc8vXlEBQiu6poLB
        EFK7fcTVExTYK/MFr1nJ/Tk3qj2LJyQyj2arNVCi5GpKjyVRCxy166kT5o8Dit7Q
        x5/i9lRJEc/fkuoO6RvT/nBnFsUijPGmgApAkb8GkP4DH9GgSdjgPUJ81+PT2dvB
        fkxPEli9+3Mad9cKUS9dmVSqW0gDJkwUUKar0y8hrXFmXgLSTrpqQE2Vbws96p9p
        ckIVjCFZ+f7kOzLft95swdJsBA++Toacrd53XhzCKrZbaTnU58jWbQdGcQjEDktv
        wRI7MQUdTzdQO1T+wK+PLgL4pMd6VNdTFFexQcoSj6NXbUld4JiQQ==
X-ME-Sender: <xms:LZJHX1PZMb2gxrX9uP8xeaBfOKE-un692r6i4PADU2_Wa_YPF4YetA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepjfgrnhhsphgvthgvrhcurfhorhhtnhgvrhcuoehhrghnshhpvght
    vghrrdhpohhrthhnvghrsehlihhvvghshihsthgvmhhsrdgthheqnecuggftrfgrthhtvg
    hrnhepkeeltdehgeefheefgeeutddviedugfdtvdelueetvdeuleeltefftdehteegtddv
    necukfhppedukeehrdejledrvddttddrfedunecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhephhgrnhhsphgvthgvrhdrphhorhhtnhgvrheslhhi
    vhgvshihshhtvghmshdrtghh
X-ME-Proxy: <xmx:LZJHX3829PFr0YbBJ2vo1OVIACU4mSXxfdgTIMvjYwYv4DvocjU1VA>
    <xmx:LZJHX0SmZcRJjCOUJ-x1np8qUFj4TbdbhpzcTW9OuRb2YY0sXK5hrQ>
    <xmx:LZJHXxtPPHae3qVhjfs0_E7GSEELeQq2jhaAvR3loylRduarxLF2mA>
    <xmx:LpJHXx4qMmbcWP-2X4yvXnvrsmf9hM_VMlf5aJXJzUoHH_p7gYIeTA>
Received: from sirshurf.example.org (unknown [185.79.200.31])
        by mail.messagingengine.com (Postfix) with ESMTPA id BA6A73280063;
        Thu, 27 Aug 2020 06:59:56 -0400 (EDT)
From:   Hanspeter Portner <hanspeter.portner@livesystems.ch>
To:     wim@linux-watchdog.org
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        Hanspeter Portner <hanspeter.portner@livesystems.ch>,
        Hanspeter Portner <dev@open-music-kontrollers.ch>
Subject: [PATCH] watchdog: it87_wdt: add IT8772 ID
Date:   Thu, 27 Aug 2020 12:59:40 +0200
Message-Id: <20200827105940.2835910-1-hanspeter.portner@livesystems.ch>
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

