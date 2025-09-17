Return-Path: <linux-watchdog+bounces-4256-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C89B8166A
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Sep 2025 20:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08E1A7B036C
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Sep 2025 18:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DD93002C7;
	Wed, 17 Sep 2025 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mJ0+g/gb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFF33002D9
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Sep 2025 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758135426; cv=none; b=AlFccJgx/FgV0cyJ0Xq47CNE7JaHrHvj1XXCin6p2qe99pJNOFXTQraJQWgaSd6GLu3/fUy3L7h6IaikjWY02sepaDG7Zuvs7mG8iSI/pB9yuUMcXGwIzewptRInKEs6BTr3MO/PgIwgfUlEh+aHUTP0NO/XBeWEyq9U2DN0NM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758135426; c=relaxed/simple;
	bh=rGHIg49NqT/vw8VGSZsrsfHcMRmvB0DOxfh5E1K8G3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fipZt6//2XFIy3qHUR2/HqQpAbMNNwspYoxFSUPvwKWqxHBa2fu/Xky5MSMj1tNJS4AarfI9hq1u6VX4193rMFRJ/tCkaDv+IYeBmgJJbbFuyR4+zjPx8Cirohllrwo8iA3fDuiKwdzC8l0IxBThXbxObZ+AS3x2eR/4PNM7ALQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mJ0+g/gb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=YW/nOjUofYiXh8
	O/soaQF4m/L42j3TGPSSIIRZmVY/A=; b=mJ0+g/gbf/0ZIq7utou8o46LYxvPsW
	3kR6OAZunOOke44zZOi7J9vB6BgnqCqMkaolWhLUTVHEO8HmVBQRqRrrTalnskIA
	tpra8bYaopFrFJZbMOeGlG78GYyHB7+i2mx445hib9NsvCJf1MjmEe+UOP0LqQ5r
	1Z/kOrm/iP3rOSXT1i+1+bNWZ1Hm4OhlbX5RSR9ArvurKQIKuhyNPfKutZJnbpxR
	v65iGkkmGGnLtnoq43KWp3MmqlpyR827SIL2gdiPfw2PyrHbWdbiH0sYJPqHbg0P
	YTyk36HcmmFf2BiUleaTnqEvd9eyI1fueqnu5PueP7KQdr6ZWPUStqSg==
Received: (qmail 3238961 invoked from network); 17 Sep 2025 20:56:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2025 20:56:59 +0200
X-UD-Smtp-Session: l3s3148p1@qDAazQM/ZMUujnvK
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
Subject: [PATCH 0/2] watchdog: add Renesas Window Watchdog support
Date: Wed, 17 Sep 2025 20:56:47 +0200
Message-ID: <20250917185651.12428-1-wsa+renesas@sang-engineering.com>
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

Tested on a SparrowHawk board (Renesas R-Car V4H).

Looking forward to comments!


Wolfram Sang (2):
  dt-bindings: watchdog: Add Renesas WWDT
  watchdog: renesas_wwdt: add driver

 .../bindings/watchdog/renesas,wwdt.yaml       |  78 +++++++++
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/renesas_wwdt.c               | 156 ++++++++++++++++++
 4 files changed, 243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml
 create mode 100644 drivers/watchdog/renesas_wwdt.c

-- 
2.47.2


