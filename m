Return-Path: <linux-watchdog+bounces-4360-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E221BBC88DC
	for <lists+linux-watchdog@lfdr.de>; Thu, 09 Oct 2025 12:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04A89188EF48
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Oct 2025 10:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE4623F42D;
	Thu,  9 Oct 2025 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fFQ61oYK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66227587D
	for <linux-watchdog@vger.kernel.org>; Thu,  9 Oct 2025 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006722; cv=none; b=AFLopmxpidASXEbcVNXtoMHtlDX1/wy1KOstpGqNbDWvj7R/41BTYFTED6Er2G08G3QNZL/7KxTwYgPjvVoXglbgkSwq/3MHav7dO4tijZFIfzUqT44T2G+Jj/5U6ooi+k0Y2lNBDRNe63C8lq3dkczhvIywcuSkeKjAhVj8Oo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006722; c=relaxed/simple;
	bh=6XdUGFb9SuwgZ0Blq4XTMD3AmM9k5U20w0Fy3lk/gzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fOrcvyCqD5QyGI3tn/eYP5q73nQwPvbcsb1p3G1hPll2Zt9CalW8lbuN71jZmZU6tPSw6oSUYSfRFKrHMda80oYJRqdFjofABLWvtbxY7c50hlvcrKCNqzlYwkIuVDo0nGTaDwoPvH8I8WNZVEopvWDCz/VXXh9vvsp0+dEtU5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fFQ61oYK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=o977p44mT0BgsF
	8oCGvxwW+xpTYNM0cPJJhZWpwiiPU=; b=fFQ61oYK1zN3Z7urTEqJZC+oBatvpt
	ZTAXdc6kFwMaIXcUSYKQeER4Xe7YHNndHOH/b/Vu/RQj0oaQ65xucw0GXmFBSLKi
	3xx7+XgpFeaQhEjAkNcGCponXiE+33303QgbzDwY4/Gb4TrBbZk9jN9LDPl26FMk
	KKNYrgStS8UZEq037vfcXRtBnD95tUcD6YkhD8+p38sti07ZyM2mTLcuDIlXA7sb
	B1uzywz+JIppG35xqcp0g9cF7poECWeoj/FO1mCvkVUyAPphW138f5FxFcj6QFXw
	VinV794XOhYak1G3cZzIMJpyi7BJ1btDi925q0plFJjwvNrRGukMJDgA==
Received: (qmail 1043211 invoked from network); 9 Oct 2025 12:45:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 12:45:15 +0200
X-UD-Smtp-Session: l3s3148p1@C04Uf7dAcI8gAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-watchdog@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v4 0/5] dt-bindings: watchdog: factor out RZ watchdogs
Date: Thu,  9 Oct 2025 12:44:58 +0200
Message-ID: <20251009104500.69787-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor changes since v3 are documented in each individual patch. The high
level view is that I included all of Geert's suggestions.

renesas,wdt.yaml describes lots of different hardware blocks which
results in complex if-structs. Factor out the different IP blocks into
their own files. I took over maintainership of the files for RZ/A and
RZ/N1 but if someone else wants them, very fine with me. RZ/G2L and
RZ/V2H have the original driver contributors as maintainers (Hi Biju, Hi
Prabhakar :)). If these need changes, please let me know, too.

After the refactoring, the V3H exception is finally added to the
original binding document and is now much easier to understand.

Passes 'dt_binding_check' and 'dtbs_check' after each patch here.
Looking forward to comments.

Happy hacking!

Wolfram Sang (5):
  dt-bindings: watchdog: factor out RZ/A watchdog
  dt-bindings: watchdog: factor out RZ/N1 watchdog
  dt-bindings: watchdog: factor out RZ/G2L watchdog
  dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
  dt-bindings: watchdog: renesas,wdt: add SWDT exception for V3H

 .../watchdog/renesas,r9a09g057-wdt.yaml       |  99 ++++++++++++
 .../bindings/watchdog/renesas,rza-wdt.yaml    |  51 ++++++
 .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 111 +++++++++++++
 .../bindings/watchdog/renesas,rzn1-wdt.yaml   |  50 ++++++
 .../bindings/watchdog/renesas,wdt.yaml        | 146 +-----------------
 5 files changed, 317 insertions(+), 140 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

-- 
2.47.2


