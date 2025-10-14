Return-Path: <linux-watchdog+bounces-4384-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF14BD9092
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 13:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A07724FED20
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 11:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C4030CD80;
	Tue, 14 Oct 2025 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JtVXGpOZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2573F2FDC29
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441430; cv=none; b=K9XbJwBfUeHPq8Dlop0ZUex1CVaCHxZrtfwgZmV8hEU7bBxj9tV61etOgKLVAA7q8zBO+wog4Z0NyIbScyoJMCKTxDUEoSIT0SvYdQr5jftAgbTeRVwz47ZbcfME0Rg3SdCtkXg2m6Y0V2wTBYm++GbzAmq//enIhhe7Z33HDag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441430; c=relaxed/simple;
	bh=DW6Soa+EyZrGsAq6scGAnX4sB2XdUmO//NkjOugJRck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQVbduaY7FQdicRyKI8gvWedhRlkDdQ0ijFWwXq0IrV4hyVTj9cS59Xvlj/D1crwjUMJtsEjWfeg4ttlX2uuBU0TSzuOLGHvzh5OjfaRxUTEn4rw17hqj67/GFNBq/gcrxLwRHFDIEJ/zMKVZlxQyg19YqIChUZYud3ML4Bcc40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JtVXGpOZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=O3Ns10gBhYghn7
	46iVy+H+W/ZDdIGY8P59pG+5DvZik=; b=JtVXGpOZrRd/5xKTzFZCG0ud0Thqnb
	EK7m+j3PQwtxO96z0gLiHM+bz/c3qNF8PCf0Q7rXLA9n1Hpjmv0/TxwgqGlM4Nrr
	Pq09FLLk9bAcHYeP3i31cRIqzceLykJYInFpG/B0q8YIjHn0wKJJ6fALq1pZN8ji
	tPubEpzS+bK6fQGSiwQ4pWdMIgpNPsaGKGr2pi5lEjeLROeAGMFTtDDsnZ1HbtCD
	Gj6Ewm4GmyN7i+jmSf8EnuwuTG7iYpxM/mZ/JXa6v0hKzP3qLqWQ1wBmMDT+z+E2
	+AE4sBufvo7A7MLKZpAPC+POBtGqUvQstEdrKwleaSLFApbTVwMng+Dg==
Received: (qmail 2943606 invoked from network); 14 Oct 2025 13:30:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 13:30:17 +0200
X-UD-Smtp-Session: l3s3148p1@pVFRtRxBuN4gAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-watchdog@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v2 0/2] watchdog: add Renesas Window Watchdog support
Date: Tue, 14 Oct 2025 13:29:52 +0200
Message-ID: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This Window Watchdog is a little peculiar because it can only be setup
once but we cannot find out if this write already happened. So,
configuration is delegated to the firmware/bootloader and the driver
will adapt to whatever is configured. The driver handles all bits
described in the datasheets. This is really all there is.

Tested on a SparrowHawk board (Renesas R-Car V4H). Based on v6.18-rc1
and build bot is already happy. Passes also binding checks and dtb
checks here.

Big picture change since v1 (details mentioned per patch):

* support not only V4H but all Gen3/4 SoCs having this WWDT

Looking forward to comments!


Wolfram Sang (2):
  dt-bindings: watchdog: Add Renesas WWDT
  watchdog: renesas_wwdt: add driver

 .../watchdog/renesas,rcar-gen3-wwdt.yaml      | 114 ++++++++++++
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/renesas_wwdt.c               | 163 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml
 create mode 100644 drivers/watchdog/renesas_wwdt.c

-- 
2.47.2


