Return-Path: <linux-watchdog+bounces-4309-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9799BB985B
	for <lists+linux-watchdog@lfdr.de>; Sun, 05 Oct 2025 16:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9EFF84E11DA
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Oct 2025 14:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BBF28B4FA;
	Sun,  5 Oct 2025 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l3VRxRVa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C29283CB1
	for <linux-watchdog@vger.kernel.org>; Sun,  5 Oct 2025 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759675487; cv=none; b=ODfL5GsUW8FVvTmDJ3Fg4LmU1XyQtzWhZepcqB3wtE8efM2KCf2TXOunljOpHwdcwOA2jzvhdnLF/gGPFtWwU9JY6qAqpIN3oB6W58rl9Lh3947znnevhBi8hOjG/AjT0TVkAPQYYFQ3/dtrOMlD730YNBbdYLV4QbeKpBSRX4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759675487; c=relaxed/simple;
	bh=JH8HkBrvP0JJVATrrE4weZfgF/3gGXB7ub2tV6yf1hI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QIWEfy3jeiYFC55WatrNbUfAjaP0hiHamMJDemNy846D8qMAdQATSEyWJI7VbPes3Uv6AUbNQU5l7SHzGBKl4jAKXqOwlFWvesUMBfdJt8DwZrs1XkgmhoogNmrDmH03pb02KqfiYCq8s2ZIJnSxqSCNbj5XYhJLbkMjP6+2paQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l3VRxRVa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=nd5MxbElV0uR3s
	9h11jXQ2NK/aCqtPViz9h+lDzI6Tc=; b=l3VRxRVaIwSgBZpe1ILIJ/EBZqKMgu
	grn5loCKY6Lpcc6R9hfIDiSHu4XF51DYkJ0UgkVK17T5OqtVl3aRYKxacGHjKpYt
	6YBuikXPpxTAtaJFP/K5wtf6pHngMTSEdj0eMZ4ju9/V7mOgfVHusYBeV1d0Mmev
	h6wtj2iUnZiVXFSOEvks8paFWXaj41kv+s+Obb+mdEV5DNJohZ6Hj5HyQdQeL/oa
	+jE5lYvLcEP//9V02GK630HHO/876gx1l50BJbvBaQMv/NQo099NQitOYsG61XfC
	5qyxCebbE+FN0O3y0BZ229nds9CiLShugBqFJtXHR63e9PM/vBmRD9rQ==
Received: (qmail 1418822 invoked from network); 5 Oct 2025 16:44:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2025 16:44:40 +0200
X-UD-Smtp-Session: l3s3148p1@2yDrX2pA5tMujnsm
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
Subject: [PATCH v2 0/4] dt-bindings: watchdog: factor out RZ watchdogs
Date: Sun,  5 Oct 2025 16:44:15 +0200
Message-ID: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor changes since v1 are documented in each individual patch.

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

 .../watchdog/renesas,r9a09g057-wdt.yaml       | 110 +++++++++++++
 .../bindings/watchdog/renesas,rza-wdt.yaml    |  51 ++++++
 .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 112 +++++++++++++
 .../bindings/watchdog/renesas,rzn1-wdt.yaml   |  48 ++++++
 .../bindings/watchdog/renesas,wdt.yaml        | 155 +-----------------
 5 files changed, 327 insertions(+), 149 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

-- 
2.47.2


