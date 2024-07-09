Return-Path: <linux-watchdog+bounces-1340-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5213292B514
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 12:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD081C22C7A
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 10:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E8315666B;
	Tue,  9 Jul 2024 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="gM37yGtm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30270155C8C;
	Tue,  9 Jul 2024 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520529; cv=none; b=E6aEm+/E/kY2fcBJ2jNvE2lYCQkT5JlBeGhxFVcCwEilTn7icy5bzbQY1ehQXaedC0zT3IdwsJzjpyUpnsbHcppAUv+cCXWQND6lK4xIqb3Kvoz174pKROruBrxw02DF+ZPBsQ/mVmLPJMlDw/B7Dj9IABkWZkWdo/fOo0+AlyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520529; c=relaxed/simple;
	bh=FE2YpU2h+P0unr9RpDRYX7VYNxOd75G0LeTzW0dGPiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MyVJwUCh4PJVfE2CG5KK9vTWx5eq8ulN9Yeg5llVUNsNji1D+LUeCxY4FyISkW15t02WydTv5AbT3eck9RDHxLr7YwKmqtv3eKVV47/YnabYuZCvlv/p20bzW8KbXX3n0JylFN2UzNNtff1x4nWSp2kAKKEEzBV1c7MuSV90Rt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=gM37yGtm; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id C76C6419EB;
	Tue,  9 Jul 2024 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F8LbkaZZ5T6LHWP6MpgVpaTLNOg4FoESQlLvyA41iYg=;
	b=gM37yGtmYrRd0oPE/NhgKI4bYc+KF1mXFND4kfNJVpcN0S7smJX7LP1WSBoE6IprfVmK5g
	PYBrvDkJErbQjnwqrsuGoAfi4Tz2wZosxR3h1HWSgmmc8KtdWQcDYuuKVxJoo9Fy8jBdo6
	uAW1nH4xaj+/F1/BKtR2vyqo0tiTgQs=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 90D21100756;
	Tue,  9 Jul 2024 10:13:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 0/4] add syscon requirement for mt7988
Date: Tue,  9 Jul 2024 12:13:22 +0200
Message-ID: <20240709101328.102969-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: cc04bfa3-18a0-4142-97ac-21d0a30ec603

From: Frank Wunderlich <frank-w@public-files.de>

Some nodes require the syscon fallback at least in u-boot when using
OF_UPSTREAM.

This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c for
"mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-node.

Frank Wunderlich (4):
  dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988 syscon requirement
  dt-bindings: clock: mediatek: add syscon requirement for mt7988
    xfi-pll
  dt-bindings: clock: mediatek: add syscon requirement for mt7988
    ethwarp
  arm64: dts: mediatek: mt7988: add syscon for watchdog, xfi-pll and
    ethwarp

 .../devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml | 6 ++++--
 .../devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml | 7 +++++--
 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml     | 5 ++++-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                  | 6 +++---
 4 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.43.0


