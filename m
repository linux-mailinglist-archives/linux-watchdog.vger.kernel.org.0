Return-Path: <linux-watchdog+bounces-26-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0D7F40DB
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Nov 2023 10:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFE2B281770
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Nov 2023 09:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884E83D3A5;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAkSlfKR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477373C065
	for <linux-watchdog@vger.kernel.org>; Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4802C4167D;
	Wed, 22 Nov 2023 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700643674;
	bh=qrQdSRYnIt0dvVsr5w3gpaU+qxRo3oybmeMtAq01eqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DAkSlfKRoqdKXl+97Zp7S7DMHBarH40Nr4aiynaIXPqYI4S+/C/llOhWE9zXFRDv9
	 s9ZfHjuRgCebecTBDgqkwFLvJkMhUQjUWoBXVqMdHKYDI8fUg5F90kTVlD9oEgoyoa
	 jfFs5Qu1uQRPveeyRzSkbBb+8UFvEdGD3XEYUDRbP+OW0novojbtIP8fNF/+ebLx1e
	 bLfnsy9+XfND+D5ivpDWwn95g74Pq9aAB482klnn3sF2CK2o+UBzQ9nAs6ZtUM94hn
	 C3q46+jK/pjNQzZIOxWl1R4Tc/Zhm/+n7w+yMwScMAsGS/rbxd4MW1AdqmHmYo68K5
	 m/J2YnspWWRng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60BDC61D96;
	Wed, 22 Nov 2023 09:01:14 +0000 (UTC)
From:
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Wed, 22 Nov 2023 11:59:49 +0300
Subject: [PATCH v5 11/39] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-ep93xx-v5-11-d59a76d5df29@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
In-Reply-To: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700643671; l=1127;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=yDvFgKkbYlXFeJISIbxBJBumhjJt07IbMFASDCbxstc=; =?utf-8?q?b=3DnUPgLWqUfPB/?=
 =?utf-8?q?EH0zfj9uDpJKoUw7+XBWKaMkeekgEfmUEtPLZiG/th4inQYFjyyBKh3edmoNW72d?=
 SYMHjbgGCjeFG07GM0UCQuaOPxdWipQ5Mw4mDRl0jkPuDrF+Vm1x
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received:
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: <nikita.shubin@maquefel.me>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add OF ID match table.

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/watchdog/ep93xx_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/ep93xx_wdt.c b/drivers/watchdog/ep93xx_wdt.c
index 59dfd7f6bf0b..af89b7bb8f66 100644
--- a/drivers/watchdog/ep93xx_wdt.c
+++ b/drivers/watchdog/ep93xx_wdt.c
@@ -19,6 +19,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/watchdog.h>
 #include <linux/io.h>
@@ -127,9 +128,16 @@ static int ep93xx_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ep93xx_wdt_of_ids[] = {
+	{ .compatible = "cirrus,ep9301-wdt" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ep93xx_wdt_of_ids);
+
 static struct platform_driver ep93xx_wdt_driver = {
 	.driver		= {
 		.name	= "ep93xx-wdt",
+		.of_match_table = ep93xx_wdt_of_ids,
 	},
 	.probe		= ep93xx_wdt_probe,
 };

-- 
2.41.0


