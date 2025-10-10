Return-Path: <linux-watchdog+bounces-4371-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE8BCC0BF
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 10:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25C7423A3B
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 08:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFE327602A;
	Fri, 10 Oct 2025 08:03:20 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E720326E6F8;
	Fri, 10 Oct 2025 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083400; cv=none; b=Tu3tVa71i7DFEKB09ULOLrezUCJg5BoiqWCPx9Fk0Ft9RNLVsFCvUSkz1bmgT+g0RtVHNK9NwJrSCfgoXzYMpB/PPh+Berta9F+HFFZOWmI9YJbzaGQRbIzrL8bo/9WGNTFNKD7eb576YymqtD7pbJ6HDaJiUcqDB3ZARAoIllU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083400; c=relaxed/simple;
	bh=e/EXtZWCi3iK9z1nOSESHp1p8RxHwCt8mI82MrXSiuY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Il0+KNPFyGiQjV8x1uDJwlw+rx//5fnqKqj+R+dIDAu3ezaFxUpuJaC/7pSZr3st33ALXR21V9sPH8OO+fbSMZOS7FgRbDYMj+2NRlwOJ+do4PZqidk3SiIUwu0DRoqNeossr+AdMLLRawrg2rHMcvcHcZIG9sE+Ix9utOGXezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Oct
 2025 16:03:15 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Oct 2025 16:03:15 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/3] watchdog: aspeed: Add AST2700 support
Date: Fri, 10 Oct 2025 16:03:12 +0800
Message-ID: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series improves the ASPEED watchdog driver to support newer
AST2700 SoC. It enhances reset mask handling to accommodate platforms
with multiple registers, adds AST2700-specific configuration, and
updates the device tree bindings accordingly.

Changes in v2:
  - Removed 'num_reset_masks' field from AST2400 platform configuration.
  - Simplify 'if' contional statement for platforms after AST2400.

Chin-Ting Kuo (3):
  dt-bindings: watchdog: aspeed,ast2400-wdt: Add support for AST2700
  watchdog: aspeed: Support variable number of reset mask registers
  watchdog: aspeed: Add support for AST2700 platform

 .../bindings/watchdog/aspeed,ast2400-wdt.yaml |   8 +-
 drivers/watchdog/aspeed_wdt.c                 |  30 +++-
 include/dt-bindings/watchdog/aspeed-wdt.h     | 138 ++++++++++++++++++
 3 files changed, 167 insertions(+), 9 deletions(-)

-- 
2.34.1


