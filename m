Return-Path: <linux-watchdog+bounces-3993-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1CB25399
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Aug 2025 21:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F51B7A39CA
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Aug 2025 19:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EB22BEFE3;
	Wed, 13 Aug 2025 19:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l2lpybtz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2F11C84C7
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Aug 2025 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755111944; cv=none; b=YNcUEc9L7CLaCleN/Yy+brzW6e8H0TrQxCLbaGi3ayKKcxZPJzSe7OovPYKBCrijg/AmIfxtgfv+IKDvFJ+qUc6sMPBRTvIVqWHGf4FB6l5BmV+oDLMBRDgoedD/Rb+TtUjgAYkFZ7ZsaXxvYnUef46+vRTKc7TQmF7Pu8KUcV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755111944; c=relaxed/simple;
	bh=fL25/7rvPrwCI5YM98cSvkz4MWs1xzd8vGXqDWggky4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ATaKZ0PrnKhSiZcAc/+8CZkVzncwkKGpjn4SYbGLJ6A45yEJ3AvxFSG5I6v8Pa3Wn1eM1Z2aGpFjQsk9JiINgse/lVGvrtM7JPilXq0rO6CFACKi1ati1jxTXM0SGh4pcXMyX0jecrr5hZFoWfVQtfNIL2SO3Ys9q5tQEgOaf50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l2lpybtz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=dsYg9uVTT31vg0
	XjgaWQbCUWMl3ZH+Hy93R1PBOM/ME=; b=l2lpybtzBjreR2b6u3ViQ1/UyacbNF
	/9x2byoTVM+OIXRDhd/ePUPQsHzzQZgkr55wr7ZGx0FXKgRa3wKFss5LDkgSFcDO
	qB0dO+dkHBiAdTWmF7PXHENsWUg0ne7tI5tZNVh7VQA0Zwc7LD/OYnNOWba4QdWf
	MSeIom1ONHeAHWcTRoxbu2gglD9qzpOyPoFQT5OBZohUtw9xTxyijdEdizAmVChw
	pKuzewYY8aKdzIY4+RDg6Xg8ELsR8/TGNcyZ4aaGkEUBEqAE875W1hn5+QZ1G99d
	vsR+aGQMC4y3ps2wr+7sEIbOlqOmEdvf8dJpJALFQkIGktVAn59iWGzg==
Received: (qmail 732673 invoked from network); 13 Aug 2025 21:05:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:05:40 +0200
X-UD-Smtp-Session: l3s3148p1@hr6u10M8jtltKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-watchdog@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH 0/3] watchdog: don't print superfluous errors
Date: Wed, 13 Aug 2025 21:05:08 +0200
Message-ID: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I found this needless printout in the Renesas RZ drivers. Then, I
updated an existing coccinelle script to find more of these in the tree.

No dependencies, buildbot is happy, based on v6.17-rc1.


Wolfram Sang (3):
  watchdog: rzg2l_wdt: don't print superfluous errors
  watchdog: rzv2h_wdt: don't print superfluous errors
  watchdog: visconti: don't print superfluous errors

 drivers/watchdog/rzg2l_wdt.c    | 4 +---
 drivers/watchdog/rzv2h_wdt.c    | 4 +---
 drivers/watchdog/visconti_wdt.c | 5 +----
 3 files changed, 3 insertions(+), 10 deletions(-)

-- 
2.47.2


