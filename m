Return-Path: <linux-watchdog+bounces-2419-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A79BE4AE
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 11:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F5A81C235AD
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 10:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A611DE3D5;
	Wed,  6 Nov 2024 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="sxsclCJe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5921DE3D4
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Nov 2024 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890079; cv=none; b=E8jYgSv5m23JcbkIfVVrVGiVg5/RMT/IaXCgevHC+WgINL16vvwTGBplI5DDtHpCr3tVndGjQFJazXDpVvZkUB5oFfrdxtVqwN3RQ6MAg01fZxpKbi4wkasUsjgiHHPqZKRjy+d6086+gHN79vKTY+wQBFci0XQgtdyclhVHyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890079; c=relaxed/simple;
	bh=9FbpAsg3o7PfFDuCF41WcBi9lk55h04DLXJFlfqA0BE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUdxDfUwoezjqsC0anm/UPn+caISKAkOuuRxaNXFEHOr0Quann4obPM/e/Q/+Gs8SN1tKFmD1KM3KaKa04CMUV4ah4xeWQCKxsstipO9EE24d1PmUueL9Y1Gaz9eZgb9G9v/pWqESyriL38BhsmeigY2PBHoQWe2x+OIQEu+EEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=sxsclCJe; arc=none smtp.client-ip=185.70.40.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730890075; x=1731149275;
	bh=9FbpAsg3o7PfFDuCF41WcBi9lk55h04DLXJFlfqA0BE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=sxsclCJegFRL6x4xkC5mrgqX0ejLFv9tv7vLYtkBjZsBQNV2k8rc9Pg5LVlrCRPgP
	 DMXkRIRLPirrQLw/MPoOBmR+xZiB8tNRGNkedeb2pElaKarIF6e0fMY6PlpFf6tuxj
	 c5ACyhW7/v50RhFxlekVQskzsOQwo+vFlHoKalmyiVDAqKX6vBH3TdD3ww9QIhVOoM
	 YlwiYEBPPB8bTLZ14feBfTjDJsQHglLtVIKm1SXl/mbgGjd7vRWuwefqdjd5TKpqOF
	 MHLqMadkPLWCzQvrKogK/5DqHb+fFPWzGWyATb2VROJtzFabLg6lPQK/6Unh689xgD
	 QsczlP9DlXxcw==
Date: Wed, 06 Nov 2024 10:47:51 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] watchdog: mediatek: Fix mtk_wdt_restart
Message-ID: <20241106104738.195968-2-y.oudjana@protonmail.com>
In-Reply-To: <20241106104738.195968-1-y.oudjana@protonmail.com>
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 2270a8af62230626aa0eba89eb49248f2a8f9a91
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Clear the IRQ enable bit of WDT_MODE before asserting software reset
in order to make TOPRGU issue a system reset signal instead of an IRQ.

Fixes: a44a45536f7b ("watchdog: Add driver for Mediatek watchdog")
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index c35f85ce8d69c..e2d7a57d6ea2e 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -225,9 +225,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt=
_dev,
 {
 =09struct mtk_wdt_dev *mtk_wdt =3D watchdog_get_drvdata(wdt_dev);
 =09void __iomem *wdt_base;
+=09u32 reg;
=20
 =09wdt_base =3D mtk_wdt->wdt_base;
=20
+=09/* Enable reset in order to issue a system reset instead of an IRQ */
+=09reg =3D readl(wdt_base + WDT_MODE);
+=09reg &=3D ~WDT_MODE_IRQ_EN;
+=09writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
+
 =09while (1) {
 =09=09writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
 =09=09mdelay(5);
--=20
2.47.0



