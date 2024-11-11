Return-Path: <linux-watchdog+bounces-2442-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F079C35FE
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Nov 2024 02:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D748B216D7
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Nov 2024 01:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57E3146A79;
	Mon, 11 Nov 2024 01:30:53 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0EB208CA;
	Mon, 11 Nov 2024 01:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731288653; cv=none; b=QlSfzUA9/PI0N0AjewywMAkd38qvNAil3HqNfRbqevjD1UXIapX8U/Q88b5d1flLqCDJhi8LzdWQVZoDiOtBMpC0RZJ97Lbyrxa1wwq2KCsF+1pYvvcWU8H9VdPDIk+PzoLXqw0sWwQpIhaNCcyYU1srlPvhc08quYq+RaZYUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731288653; c=relaxed/simple;
	bh=RqpeZk0PGM377DXiY6/guH5PPVOIEwT1S49eX+ApDgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgP5+nKnh0/JJIPuFtjWHe0aUoOtG7zLVu7ssSpSwuCRXs7vfgG/y1B+XVvEEvAsMo6Zv3Xz3bacxKWwSUNTq8ZgUIzhewcxZDI/uA6qHn9RquB4stShHdBWvm3NqDbS5ex6POz6lg6Ty0faJUz64jOXkHn91eJnu8a5GmX2DaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6E21480;
	Sun, 10 Nov 2024 17:31:21 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36D2E3F66E;
	Sun, 10 Nov 2024 17:30:50 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 03/14] dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
Date: Mon, 11 Nov 2024 01:30:22 +0000
Message-ID: <20241111013033.22793-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111013033.22793-1-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 SoC features a watchdog similar to the one used in
previous SoCs, but moves some registers around (by just one word), making
it incompatible to existing IPs.

Add the new name to the list of compatible string, and also to the list
of IP requiring two clock inputs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 64c8f73938099..b35ac03d51727 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - const: allwinner,sun20i-d1-wdt-reset
           - const: allwinner,sun20i-d1-wdt
+      - const: allwinner,sun55i-a523-wdt
 
   reg:
     maxItems: 1
@@ -60,6 +61,7 @@ if:
           - allwinner,sun20i-d1-wdt-reset
           - allwinner,sun50i-r329-wdt
           - allwinner,sun50i-r329-wdt-reset
+          - allwinner,sun55i-a523-wdt
 
 then:
   properties:
-- 
2.46.2


