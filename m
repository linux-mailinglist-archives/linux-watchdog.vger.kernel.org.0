Return-Path: <linux-watchdog+bounces-2645-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF189FF332
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jan 2025 08:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E44147A13B0
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jan 2025 07:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A8E219E4;
	Wed,  1 Jan 2025 07:06:31 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258217543;
	Wed,  1 Jan 2025 07:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735715191; cv=none; b=j161GoCf4mQadkcrveQre3S3TSChAbK/85/IRzguZd90CHYBp2sy/H2OhYP4LCkHvOCHS7Ep0ZKeCxbqpylwZo2N/nTq8Pj44MXnNOieXHEHnQ2USuEvTV3Icv8BhbP9y+yn4yVI53fQFK7//BU2aUiYpV2CkDGO0a5ZhnGQBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735715191; c=relaxed/simple;
	bh=M6uGJmYw44zN+fQjiG8DJFAmdOQrPSd6+Qa6uITln9Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qK10KY8KZCtrGCbqRD2hI3sFb1K16qcwydLqr0pmtThmYSt5wUKW6khayJuplyI86JQ9+KGul9TF8zmGBd0IsLANLGnErKuoKKk+/NG+fLX5p4PfFOqZxZQPCH745hH5MsRt8SuGC6iZZIjn84M5Fwk6Esq5MqM0rWUoZm7vgYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 1 Jan
 2025 15:01:16 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 1 Jan 2025 15:01:16 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <andrew@codeconstruct.com.au>, <linux@roeck-us.net>,
	<wim@linux-watchdog.org>, <joel@jms.id.au>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<BMC-SW@aspeedtech.com>, <chnguyen@amperecomputing.com>,
	<aaron_lee@aspeedtech.com>
Subject: [PATCH v5 0/1] Update ASPEED WDT bootstatus
Date: Wed, 1 Jan 2025 15:01:15 +0800
Message-ID: <20250101070116.2287171-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series inherits the patch submitted by Peter.
https://patchwork.kernel.org/project/linux-watchdog/patch/20240430143114.1323686-2-peteryin.openbmc@gmail.com/
Bootstatus mechanism is reconstructed to the latest
architecture and for all existing ASPEED BMC platforms.

Changes in v2:
  - Support SW restart on AST2600 by default without
    adding any dts property.

Changes in v3:
  - Get watchdog controller index by dividing register
    base offset by register size.

Changes in v4:
  - Update the commit message for updating bootstatus
    handling patch.
  - Rename aspeed_wdt_config struct to aspeed_wdt_data.
  - Create restart callback function.

Changes in v5:
  - Remove SW reset mechanism since there is no consensus
    about bootstatus for SW reset currently.
  - Correct the method for clearing reset event flag on
    AST2400 and AST2500 legacy platforms.

Chin-Ting Kuo (1):
  watchdog: aspeed: Update bootstatus handling

 drivers/watchdog/aspeed_wdt.c | 85 ++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

-- 
2.34.1


