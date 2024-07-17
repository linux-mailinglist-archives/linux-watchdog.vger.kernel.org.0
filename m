Return-Path: <linux-watchdog+bounces-1401-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 575C8933CB3
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Jul 2024 13:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11E6C284794
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Jul 2024 11:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1289D17F505;
	Wed, 17 Jul 2024 11:57:13 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C46314B07B;
	Wed, 17 Jul 2024 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721217433; cv=none; b=X1CJVXy9U6jHnGZhUwl9JVpNo8qgenFDtWDvXclmLqmSo3lq1Kz2PvotksvqV64txasC2he01eqY5FgtNhp34XyDd4X9tiLOr4gSRAjazELd+JuAY+X5z1jo4R1PqoQDmPVnEGs69qCb8T1l62/2xD+kEEJ1FHNGht1PBW2ZcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721217433; c=relaxed/simple;
	bh=R0wUdlTiRlSeyqka72txlj5Rwwwp+SPTk9VEx7Apox0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvRzb7Wqo+JLBhI3IDCk1kbjCYZHIZ7ayE/evyJBcxI22dMGSXexqBCPQnCauqmMfgyeiZVfr0era6UYRLB/hBL2+j+1G6glu9xqYtAW3aLUq14beulUeitwUTOl4tMsx6mJP0P91zD4N622Nvn2KaW5rgEZ6cT4n/VSm+ludYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,214,1716217200"; 
   d="scan'208";a="215585497"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2024 20:57:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5FD25400C744;
	Wed, 17 Jul 2024 20:56:57 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Pavel Machek <pavel@denx.de>
Subject: [PATCH] dt-bindings: watchdog: dlg,da9062-watchdog: Drop blank space
Date: Wed, 17 Jul 2024 12:56:47 +0100
Message-ID: <20240717115649.131914-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary blank space from binding documentation.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZpemkYsK6zQgGCF2@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
index c8f698120597..64619ba08d40 100644
--- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
+++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
@@ -28,7 +28,7 @@ properties:
       Add this property to disable the watchdog during suspend.
       Only use this option if you can't use the watchdog automatic suspend
       function during a suspend (see register CONTROL_B).
-  
+
   dlg,wdt-sd:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1]
-- 
2.43.0


