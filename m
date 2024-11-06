Return-Path: <linux-watchdog+bounces-2420-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639F69BE4B2
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 11:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26857284E77
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 10:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9CC1DF727;
	Wed,  6 Nov 2024 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Cy8eQt3i"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch [185.70.40.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A931DE4C5
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Nov 2024 10:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890082; cv=none; b=N/yr5MTdRBjVaghQ/8+F60IisZj8PlGyqVQcSQJY91u5NVR9ty+JR30/CjG7L+gHPwK9Ovx7oUAXMcLQSwTvs2Vv6Ifw6Q5wL4cE8AGzZXeffgk4zQsGphH6gwuE2rQOaAHPYVi2hJ/vZCwHOvP0sQyedkD6gmrbLriS4MiTkAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890082; c=relaxed/simple;
	bh=zU+xzVRqVU4LYpkKdVLWEEjtVjk1XFI0K39CedsBJDU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKwiqLH+eCZ87TwNcZ5TF0jJa4qGnXdBSHKRcYm9zFuBAlx+gh9EWam7tVDaivoUj+PkpF+zPih7RTKduDMdcnkTgbun+xoxtZjM93EmSxSJYmAhAnzYKJBAxvM5I/skQVtVGid+t/OOwQT08G3tfbRAtEi5lI6s4wUIiK0duJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Cy8eQt3i; arc=none smtp.client-ip=185.70.40.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730890078; x=1731149278;
	bh=kkzLaSae52UuqsoJEc/MkAHf/7nI2oM6ay3zhyqh1R0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Cy8eQt3i+sVmuzrwQUbkZo+3V9QU37BBbArhTMO+ocXEiL0ZFAebfWSsf1pH/gFYf
	 itas4urWbas5hv2fE7L78PfbkEpDBIeZjYjTcqmfIAezQlUrP++XjhPnoy1Z3vyWB7
	 AmkK04GCPFMtdkq05wip74al1LhTcwoMIT9rAN4CUroo5SjF9RYBsqth1RgvaO6/ZJ
	 j6GCYxgUUmsmWtA3xejmU5abmxovcOxub+p9ADzFOI+Sc4KZG7Vpby0vPbivXMhK2/
	 XEL2IsSm422a979gS6V6KIXDMpgI+D/cOYWjUb0RGw1fNKlUidqIQWU9h8ZnGK3oqG
	 AsszMpn32hc6w==
Date: Wed, 06 Nov 2024 10:47:55 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] watchdog: mediatek: Add support for MT6735 TOPRGU/WDT
Message-ID: <20241106104738.195968-3-y.oudjana@protonmail.com>
In-Reply-To: <20241106104738.195968-1-y.oudjana@protonmail.com>
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 8b289141cd324fdc2ef6f752e18c3d797afabfa6
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add support for the Top Reset Generation Unit/Watchdog Timer found on
MT6735.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e2d7a57d6ea2e..91d110646e16f 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
=20
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
@@ -87,6 +88,10 @@ static const struct mtk_wdt_data mt2712_data =3D {
 =09.toprgu_sw_rst_num =3D MT2712_TOPRGU_SW_RST_NUM,
 };
=20
+static const struct mtk_wdt_data mt6735_data =3D {
+=09.toprgu_sw_rst_num =3D MT6735_TOPRGU_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6795_data =3D {
 =09.toprgu_sw_rst_num =3D MT6795_TOPRGU_SW_RST_NUM,
 };
@@ -489,6 +494,7 @@ static int mtk_wdt_resume(struct device *dev)
 static const struct of_device_id mtk_wdt_dt_ids[] =3D {
 =09{ .compatible =3D "mediatek,mt2712-wdt", .data =3D &mt2712_data },
 =09{ .compatible =3D "mediatek,mt6589-wdt" },
+=09{ .compatible =3D "mediatek,mt6735-wdt", .data =3D &mt6735_data },
 =09{ .compatible =3D "mediatek,mt6795-wdt", .data =3D &mt6795_data },
 =09{ .compatible =3D "mediatek,mt7986-wdt", .data =3D &mt7986_data },
 =09{ .compatible =3D "mediatek,mt7988-wdt", .data =3D &mt7988_data },
--=20
2.47.0



