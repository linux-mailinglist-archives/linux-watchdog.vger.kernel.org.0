Return-Path: <linux-watchdog+bounces-2587-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC02F9F5B7E
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 01:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED4AD7A21EF
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 00:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B540A19BBC;
	Wed, 18 Dec 2024 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncCrxbvG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFFF849C;
	Wed, 18 Dec 2024 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734482060; cv=none; b=Hwy2vChosNiCaV7qY07zNIEtnJXcJR6cMqoGSVja4F/XJpBMLM7qCvm+Db5S5FA7cqL7cusXEudstxD7WgtxpkRaJq1crfgslgNMEcELjI57Jk7fdVQVUvBTVzTP0dACS9q2MmgKAT7us8TykLIP4bEDkIUcbjZ+Odm3Hy5f6Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734482060; c=relaxed/simple;
	bh=V5ojwJhdvZELqtMzKQ0qiNw8DBTqLjm/Grdr1SxeUoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F1BQttXI84eHVUgp8db94AI1KUoNBLyTXUPeefk6AGVGLZYgMNhEzULMQEvwTXJ//DE0v+Cx1vppYBDjGNGBguQvp/jc7Fq2IcRVqg6DY08vvkUnMg1kvKl4J9phGL1Q7+8mFtAcWviGgu3vck4FmIDDOF/8WObO7p9k67j2X1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncCrxbvG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363ae65100so35644125e9.0;
        Tue, 17 Dec 2024 16:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734482057; x=1735086857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJZi8MhwRYBoDi/As+1Itjy+lZpOWJHC2REh92MHoZs=;
        b=ncCrxbvGuIwgl5JX7MOAveA1ILYUkWIypZ0lgZCshWYYs8/5go0u7E0jYPXw+tkaVP
         P0urqvoXW688L8lbZM/DSpxCPfvY7stY7zeJikV0Nx0iZvHT4ry5x8Edq8a0TLjr23si
         uFQ2WNzLxi38I/jfh8s2flAm56RA7legh0TPQy4juHYP+k0Tj7dFnzyfufKoo08sIH58
         wShIFOHS8z29sXBon1L5va7Vk6QzWq7CRIGlLq32KVNwCRVXcROM6+C+kv/tlxjgVgRk
         iC3WCmcl1y3bIkNbUXZnnR9J1uX6YuES9h4jWUPw5mFbij0W90Lxk7qmf5RbzmGub+Rb
         PddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734482057; x=1735086857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJZi8MhwRYBoDi/As+1Itjy+lZpOWJHC2REh92MHoZs=;
        b=c0M0Pjev+a9H+02nRybTAgv74TBQvRU8/FdXDMEctjcenWAXEbk2vTwN2mCe6NTqmQ
         +xe0hrLehTjjDfukv+UTbAKbVlEGFAj5qlgG513TjhCC16jOQ4wxP7TMqmRQTMP8Q+Eq
         W/yDZNqU3y7XsXMc1QHgafo6UbXltH2ZISHMdwDHAjRjDLN1YEXIBlczdXEs49ywvINC
         /TdcRDLNvKZgQyp3y2PP9mEGa2ieu9cRupXhmuwAtQl70nGdiSGPDvXNxjCgakauGZs4
         gFDqCo2JAUXC1r6LO4uDa1CALDPnP83TewOaeyrQnPizP5GIHmU3JOOU8k7TuxPNufMS
         kfwA==
X-Forwarded-Encrypted: i=1; AJvYcCU9hESFPmG+hCOSRhHKjgQxNsNqLdARQ4htB4pa7XvSKJ8L9uR6823587EnFgqFVr9nGgBPIiW0ZRSw@vger.kernel.org, AJvYcCW2n7P18AORAr3Eaayq6UTtw5RPO6nubmBtPErfAE6BDI3W6DVW23Z9fVVORbhXymt9x0DKEZEU7JdgXEG8/Ec=@vger.kernel.org, AJvYcCWD4Sna7RNfc630+UvBk8wDr/HogprvM/+Fgrf9fz84pyPiVt0G/JYBuQ8lw50GfAaat7Ba+jM2QgRK@vger.kernel.org, AJvYcCXVb8Su1k1ztDzg156AEJUya7c6jCF8Ph8zJPWbwrEVk8pVNNUp4Lt3RQQj4wmUqxxnchEwvoCNlLrSQkYe@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrta2QLOYu8g1zO3helSils/uiLa0Z2vC8MEIMxDvWBftoUTs
	H1ebELh2bdToHDari2qLv2YRhbAhHsXQNVvcqyJIE9+K+YiFXHYZ
X-Gm-Gg: ASbGncvBgEiMhOEFYTj1PmZ8GOGzuJQ1W8Jl046heG8WMWxiQD9hYDCZI6+mKb61zHV
	ze53EzMjlRO/RzL1huxoIkuNNM+Jxfxx2Xah8I9TiD9wHSokfGZM9x2QNnF4j9fPmmGvBJIVab9
	u7HqhP+xjAAq/lN5chVpWbmwzSwgi7LH8EqadOF3XY7Yrmk5wznMpltqj4wiNjsyawLCb9g+e5+
	rPSnSVj+rq1HXQi5qpKvFxM5TZgMa/FhiFM/EUJsovrQsxtkXHQ0k8gGF4pTVN5/PptQtWTLcvt
	Ih2v1vG7yg==
X-Google-Smtp-Source: AGHT+IHoCxgDRQXpErfIHC8bh0TXZF9RRQ4zCFWw3yopVIfNcBCmTROqZjkNdugGLSNfDmtauytPwA==
X-Received: by 2002:a05:6000:184e:b0:386:1ab5:f0e1 with SMTP id ffacd0b85a97d-388e4d83590mr595380f8f.14.1734482057102;
        Tue, 17 Dec 2024 16:34:17 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b287sm2365625e9.29.2024.12.17.16.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:34:16 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] Add support to retrieve the bootstatus from watchdog for RZ/V2H(P) SoC
Date: Wed, 18 Dec 2024 00:34:08 +0000
Message-ID: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds SYSCON support to retrieve boot status information
for RZ/V2H(P) SoC.
Summary of Changes,

    Clock:
        Add syscon compatible support to the CPG block in bindings and
        device trees.

    Watchdog:
        Document the renesas,r9a09g057-syscon-wdt-errorrst property.
        Update the watchdog driver to fetch and report boot status via
        Error Reset Registers (CPG_ERROR_RSTm).

    Device Tree:
        Add the syscon property to CPG and WDT nodes in R9A09G057 and
        R9A09G047 SoC DTSI.

These changes enable the watchdog driver to identify boot sources like
Power-on Reset and Watchdog Reset, improving system diagnostics.

Cheers,
Prabhakar

Lad Prabhakar (6):
  dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG block
  arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
  arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
  dt-bindings: watchdog: renesas: Document
    `renesas,r9a09g057-syscon-wdt-errorrst` property
  watchdog: rzv2h_wdt: Add support to retrieve the bootstatus
    information
  arm64: dts: renesas: r9a09g057: Add
    `renesas,r9a09g057-syscon-wdt-errorrst` property to WDT node

 .../bindings/clock/renesas,rzv2h-cpg.yaml     | 10 ++--
 .../bindings/watchdog/renesas,wdt.yaml        | 17 +++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  6 ++-
 drivers/watchdog/rzv2h_wdt.c                  | 48 ++++++++++++++++++-
 5 files changed, 76 insertions(+), 7 deletions(-)

-- 
2.43.0


