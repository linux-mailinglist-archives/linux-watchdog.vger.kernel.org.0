Return-Path: <linux-watchdog+bounces-2677-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92873A0B577
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB77B165B81
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 11:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C11C2451D6;
	Mon, 13 Jan 2025 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWWmKXSd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C923ED59;
	Mon, 13 Jan 2025 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767443; cv=none; b=LqieSYp9oAGdaMZxwVV0Ut7n6wxI/PjLmLAT++2rFNAs1NYasJZQPbI7KmW5bMvGkvcRUmBZkqXsdgOjcIW7A8yWvWjzgWTjkYuzlod+EtSYmUVsPkdlmre2v7EFWwCaiUu4OyLawBJbOnAbXJvXldbaOxfQKLdZvDcHPbbW0Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767443; c=relaxed/simple;
	bh=cdAjQ80H41TkTXNPSgKebYoB9U6jHbEle+0cqA0dy9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCoe69tR4BLAxCP6qEYdmHm1nrfnl2asLzkyIn/7/SwpDAoaQoD7UNNPNuT+aYfB0d3bD+pWwNc+3y/TlbYrdP8xSCPQHEvgyFwsbe4RcK2FeScd2r9XfBYjph50uKR+mCAIS3VQMUlUQx54zSnQG/OvQ4NBi9XgKeRN9ENdat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWWmKXSd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38a8b35e168so2538410f8f.1;
        Mon, 13 Jan 2025 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767440; x=1737372240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5O3X8a0R+Yt1jVf63BZR05806ljPlTp/OS+UFy1/1k=;
        b=UWWmKXSdZhfl7INC4P7B5MontH4TBNJZobp7X6xJp6trZ9VSwoY18NyLiggX0AeEU1
         9KvhSPgW/YI0W8JQpphbTtySxgHsfCUMXJEn5DLHxugsR7bGm3kM+2mRcAGEWEAwfITW
         z1AiiUghRpLYg1GWG0/Vff+GRyLNJmYVosg3XhIGAW7Mm+muUnOZigTYfeBkZoIQYbKS
         Zc6YdWoEFLpRK7JuAFSyNfzILqiQW8kuE1U920Z7IZE7vThmLbRLcydognmOgYIIEO0z
         t+ACQIwfNWegP2lqwlw1OD7iNBOZS9jZEzlXINqeB9yr3cUhAusNlccW9+EE6TlsznIM
         4rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767440; x=1737372240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5O3X8a0R+Yt1jVf63BZR05806ljPlTp/OS+UFy1/1k=;
        b=msx16cp0HvXMCWJqIqDuCXcOEkceV1D6pNQeIEGvZjHo5H8EzCJNgNPhd3oFpY1lDI
         gQLUy9lPCIWeL0KtuHZ1givlDoD5sEan3HsDbv54rV0jhERZ8lAT0hgV+/yRky7Eqj/R
         9dIywKZFzrPAFooVvGYHTUthLkDSAuuNC0+2a2iKv26hnwoxNT0PrO2aX0JwJUos+E6u
         cXpk6vyNHIQik01W1LCXix9adw3Xauo6o3E9FFSge95ywvKTFLcrx9W4GI7JnuRdmc2N
         6WdCHL2388VWaJRU8A+OaFUdwamr0ixtG8O0MYlVuzI0I7VvYGaP0a9yjEOAQDV7XETZ
         exCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUruCSmADxo+LPoG/YMioKbHSuTiy53hg3gGnL6+kXhrRkVoc1z1ddk4CmdwFnRHtMthlKH1Sf3kEhLr8RhuCY=@vger.kernel.org, AJvYcCVCr71n0mmzrcWYQeb8TCWv3uSKHamAa10VLLZi5Sj2SG3sNWCgIeIbEmGfCzaIxYw1qd7Y2k5PmpWu@vger.kernel.org, AJvYcCVVZmJr1nEGao1IwaXNvPDHkVw2fqtRSqtSC0AS+e6qojSzdT4Plt3kmyu10S39Ycb2icTrVkVWDHc6@vger.kernel.org, AJvYcCWXmE26k0ZSYuj/V3lsg9df2gvLA+6jUskt893fi6tcmcXR1xEbUbiFjqDDeFNVr/Q7qlGYlslbJX/FlSW6@vger.kernel.org
X-Gm-Message-State: AOJu0YyAfcSNhqWi1MIxZYx+Ef3qS2NfI8pZeCQa/5fJpw6x05aTf6E8
	IVAsxZFUeI7giNWJPyxqnWoxCB0QRY/y2PSfZ1sl1jPbzRLSlkUy
X-Gm-Gg: ASbGncvOh1h4+aMlbDe9DTIos0UtMWjUWUl+nZs+RwCMmAs1Z3Wlguv85dAzD4D1S+K
	xF7Qr1OxaRPr5QAQJJ1t4auBDOLR1kqjuaStTqa0+1M/NqoO3vJq+/gqKUaGEmTjNxzDjA2Vcr4
	5WDQlvXAxzyUvR0La7qLWiCV8iIT4GBVoHuQMf6QZLK+NnhrYP3txzZCXoYopAili0RFQ3DVBEA
	vMF7KrhqhZCC5Xtg4eDpQ3CBr0Oh2GOeuDJb46OVgC2+UJItQlm2VHItw+VSvII1+kiJHgWOWVd
	BA2PFgr2Kw==
X-Google-Smtp-Source: AGHT+IGoY+FCIwrnhBbut/KgtEpoQMMer8bVkgHmJ3gTlx65spUb8w6x0WF86aPV0OeoQRIx4pM5yQ==
X-Received: by 2002:a5d:6c6c:0:b0:386:4244:15c7 with SMTP id ffacd0b85a97d-38a8b0faaadmr15219564f8f.25.1736767440266;
        Mon, 13 Jan 2025 03:24:00 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f04df606sm107597115e9.12.2025.01.13.03.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:23:59 -0800 (PST)
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
Subject: [PATCH v3 2/6] arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
Date: Mon, 13 Jan 2025 11:23:45 +0000
Message-ID: <20250113112349.801875-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `syscon` compatible for CPG node to allow the IP blocks to interact
with the CPG registers as needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- No change

v1->v2
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 200e9ea89193..57fbe92e794e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -145,7 +145,7 @@ pinctrl: pinctrl@10410000 {
 		};
 
 		cpg: clock-controller@10420000 {
-			compatible = "renesas,r9a09g047-cpg";
+			compatible = "renesas,r9a09g047-cpg", "syscon";
 			reg = <0 0x10420000 0 0x10000>;
 			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
 			clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


