Return-Path: <linux-watchdog+bounces-4280-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8099CBA379B
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Sep 2025 13:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BE764E1A71
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Sep 2025 11:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5EE2DCF57;
	Fri, 26 Sep 2025 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k0zrELMq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836FF246BC6
	for <linux-watchdog@vger.kernel.org>; Fri, 26 Sep 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885747; cv=none; b=NO4uiijbz63mCRwVhm7CHZM4Eht8vR9gUYMPbgoqClILy211pPIYa70QMAVINm5rJJ51t8hFVFkztF1CGZDaLqMzg1TBuzbwIgo07OqV9HA6VEbtFKmY7l4Ci9XZd1RKlJ/hUQ6/+EaId4UA2gBxliNyFcTQSIe6ns7Ur3i1qVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885747; c=relaxed/simple;
	bh=uczCV58L1gcvvoMjv9HOfVYJ9FLAcVJVI6xQzArt9fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXMj1HuAk0QvwG+FVWmCKwJedWsdFv/epG307hlrSi+qBMOac6c4+9rG+SUvxNkQiJ5OSSjBOJhv2PuBaIVQqFoEeB9hkgzmCpZvsEU+LCDvSl/fGK8ynFH6pwPxe/9IyPvgMBs+GXi35utM3fqqlIqUE68tmlNCa0Dun/RUFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k0zrELMq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=50J6WtzWynpdtU
	ZwKZIR/vgFfvSioChAy6DscfG8CJA=; b=k0zrELMqujELidyY8reLxD/w2wa3hK
	tAXfMkql3LHeJ91qnq+rKFtssiNQLl5l2SPoKJPWiGDAY2XtCYvIvfT7CoJpKGZW
	WaZ/42JJwIQ9VnR8D4gMVzTyIoB9IZorNZu4fHdgZeIVFrL2lOs+uK8ShIERloIi
	mMFM4DR5ahFcRqPWCj0R2eodTzR8XLxOkepqj0FAfpiPnKzxRi/dab52AJ30EP1N
	2YdUc+LOugHgFn8H4Pv12HLhpZGy6z0G/hpZosOowZlN708IPvCXAHIr1mUQfn5H
	Fu0UHoN4Dm3EzXG1N8qVCKVpAqti5FWULjWw+2J/SIpje0gZV2FFFWSQ==
Received: (qmail 2235202 invoked from network); 26 Sep 2025 13:22:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 13:22:19 +0200
X-UD-Smtp-Session: l3s3148p1@oMa0f7I/kosgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-watchdog@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH 0/4] dt-bindings: watchdog: factor out RZ watchdogs
Date: Fri, 26 Sep 2025 13:22:12 +0200
Message-ID: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

renesas,wdt.yaml describes lots of different hardware blocks which
results in complex if-structs. Factor out the different IP blocks into
their own files. I took over maintainership of the files for RZ/A and
RZ/N1 but if someone else wants them, very fine with me. RZ/G2L and
RZ/V2H have the original driver contributors as maintainers (Hi Biju, Hi
Prabhakar :)). If these need changes, please let me know, too.

Passes 'dt_binding_check' and 'dtbs_check' after each patch here.
Looking forward to comments.

Happy hacking!


Wolfram Sang (4):
  dt-bindings: watchdog: factor out RZ/A watchdog
  dt-bindings: watchdog: factor out RZ/N1 watchdog
  dt-bindings: watchdog: factor out RZ/G2L watchdog
  dt-bindings: watchdog: factor out RZ/V2H(P) watchdog

 .../watchdog/renesas,r9a09g057-wdt.yaml       | 113 +++++++++++++
 .../bindings/watchdog/renesas,rza-wdt.yaml    |  51 ++++++
 .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 111 +++++++++++++
 .../bindings/watchdog/renesas,rzn1-wdt.yaml   |  49 ++++++
 .../bindings/watchdog/renesas,wdt.yaml        | 155 +-----------------
 5 files changed, 330 insertions(+), 149 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

-- 
2.47.2


