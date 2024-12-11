Return-Path: <linux-watchdog+bounces-2543-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D03FB9ED4ED
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 19:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59D2D1888B45
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 18:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650B22288CE;
	Wed, 11 Dec 2024 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzKETxIB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394292288C9;
	Wed, 11 Dec 2024 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733943036; cv=none; b=FHfYL7OWO6qBibVGrBmog7Bbago4hitSS6v8t5fdLyeToz9L3YToL+BkGgJ/bTqpGiR5u8ZWCF8/yoCIN4X55o8CVi17dC9YLWY7uMNX0ygRNv/yqGOPMhNIHRWDxo3DQkQDnp3Bi6c1AjjxONUfcNkINiFlYxrzDLj0B/xS7+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733943036; c=relaxed/simple;
	bh=4EXLjDTriVc1je8/0CUblwdhPgHCunMQ0LA3jn8a5AM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cIBDkAfA92cjbCTWXId8MEIMFTqG57rt70Tobig1aW/na3qHfWzOh7U3lZoPSaGaQ/zqVWgs6mQ/KOwL+9DNH1XnpBs9S8hGSLGGvC+Y5iGQHbClZD0YPY4YdVxjXMHisIQkSh0eK6hkdmEVWtNm8kHUcqGdOw8giomSOKrhjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzKETxIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3268C4CED2;
	Wed, 11 Dec 2024 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943036;
	bh=4EXLjDTriVc1je8/0CUblwdhPgHCunMQ0LA3jn8a5AM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VzKETxIBY6M2tTVxSyMrWX6sLyCO5YEDgPgTt2jzA2mWktvZwGArEL+1qG4zR3QpB
	 y6JcL57z4B9XCXrF/s/vHvlDbIC1TNp1rFDhAUKeAWfNYNHgHTsz+DaUEawoLGgkMB
	 NpfnpneoI1z15JJnZwTqV5sgz7UPbejILsa9SqeUxg0y36P81Ba+fL28+6ATB46i1f
	 FpMipNMxYqt3dAuN5yxjIGNt+TbqntgYcZlEbOUdAh9zQK+7EH+ScyXkFmIR06MfNw
	 ee8a6sotdovGzsiW28kO1aqMfV67217pGw0c8f3mhjvnzGbV+oZEt/HFnJZ+1yp2AL
	 RNiW3clH0oipg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 04/36] watchdog: mediatek: Add support for MT6735 TOPRGU/WDT
Date: Wed, 11 Dec 2024 13:49:20 -0500
Message-ID: <20241211185028.3841047-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185028.3841047-1-sashal@kernel.org>
References: <20241211185028.3841047-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.4
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

[ Upstream commit 15ddf704f56f8c95ff74dfd1157ed8646b322fa1 ]

Add support for the Top Reset Generation Unit/Watchdog Timer found on
MT6735.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20241106104738.195968-3-y.oudjana@protonmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index c35f85ce8d69c..91a11715f6de5 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
@@ -87,6 +88,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6735_data = {
+	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
 };
@@ -483,6 +488,7 @@ static int mtk_wdt_resume(struct device *dev)
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
-- 
2.43.0


