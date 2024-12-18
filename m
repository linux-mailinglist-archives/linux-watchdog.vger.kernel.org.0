Return-Path: <linux-watchdog+bounces-2588-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D429F5B80
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 01:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D4816B035
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 00:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E853535947;
	Wed, 18 Dec 2024 00:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irNtXeyV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282901DFEF;
	Wed, 18 Dec 2024 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734482062; cv=none; b=aQZ8hMTg+wxx6Ic0iScEVRuineJbUH2Q4fgS/02JyXQmiO8Wo5c9bKl7x4i4GmUHievJugoNKN+dOFZPoiQZIKKIjsCOVIYn1KxmsckPzTXkzMIu+zvR+AHsmby/TqRu6TrY6gNeT94OjaPFa1JDArcU7ghn1taRD1EsOdU9tH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734482062; c=relaxed/simple;
	bh=B3HCa7+jQiYyUi3o+aXQZwpW49Pk5OrZTW2OksbQznw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNN4EfchkRrf54PsS/ky1ADpiBL41NyNqVHWRGPD3s7Whh9ZdiqY82ozD51XdIwk5OFrbHVB+GKQNl7KjzDuJSLLTw/0MkXtXzOK0Hde5WYeJ1QJS1SANm3D688poEJKtQX96rWGMKtYyuiAYUBtSSQnXcJD6j0njwcxJiAPhBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irNtXeyV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43622354a3eso41369325e9.1;
        Tue, 17 Dec 2024 16:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734482059; x=1735086859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af2GxGoDsM+J8AI71Qt7E5QlnwpUB1Bcv/VScnNj+u0=;
        b=irNtXeyV0XoiHDaBWJxbr/UY7dwCIBVc1JaA/8xfyQeLjG+230IJlDKhlwTvBClI+X
         3JdLGLXGKDnz3+4c8W2dJ1Ez0K4AKshek+rxigaMzra18ayOAq3yculrIyIFZr7Uxlmv
         DUhhl4KUVnrLvt0eeg/MJQ7PmuyPyqm7YdC4dzBwsF53qF3NKHSmC6W94R2LlPhxX437
         LzHpWMjCr4B8eEwEZWmo/DqkpRjAfG9bBEpiwwL56MQd7psUs8S3uqgNXWPaqH8UD5RY
         OwTZiHGwj3y6JlXJIL/u1/XecUNVo3KBEMtXNVf7Zoy81FtHpHLS2kjdyf5Yqy6V5NvQ
         WdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734482059; x=1735086859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=af2GxGoDsM+J8AI71Qt7E5QlnwpUB1Bcv/VScnNj+u0=;
        b=G4W0JTLODOPJA6bOxGg0Jv0jgFFmyl0m52rDQg7fPwXd5uf4nQ/xpYdjgbncL7ooq2
         OIgJAok1cVASkgaXQFp3klJ+AgOoA0NM6TtdZN8EwoSbeSqSal2L3mF3kPAQwAykbYoq
         cj2H4p1dglHruRVchwHeKdxzSroPLbL0N+ZUDAhrH8pha3dd9SuSzFaKNMTful0knVsW
         UEjtYehzEjHBWTcQM/UWfI9OHuezPDHhZ6YWZnDYkdmc6JLe2RahI9C2yYZ4B8tSaY4B
         UQ7yf81RuwEDfnUwhZ5AxrUvpv5iblB/jwLHoDvvDidg6K0XKlb7OeXTKqd/lclFJwkr
         AxgA==
X-Forwarded-Encrypted: i=1; AJvYcCUHn2UJGYIZSbVWSqc3B+Qoesr4txDrcAXh4TuiyDx7//IG6eo00mTPI063LrZQnrNZmLZan1AXYKwO@vger.kernel.org, AJvYcCWHw0jY9ax9MHzQ9DyFN9zkageoz/ajChiNPQXS8/+RZdD8EbMkzUID7BIDNgeZdFd/D4jaWevKjBi8@vger.kernel.org, AJvYcCWbL85Q9DlFd0KKQJiuBNQ8CrZITIasaiy3Caq/1w75EIqCCAJE/PLGClSYGdL6e9JMPasg6jldASw1jgTAh08=@vger.kernel.org, AJvYcCX/Cfzexwl3GMeQTEep5oYbwVhLlujlWfFs7vp4zJxMptump/wiZM56C5RHB1XUe9WUiHcTjR0uF/qoVURK@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3rXF+o+zExjVJRs5aWQc24VjPEwFObv+0r9FJqoKLp2KoNL9
	V9RAiogNF2uKz2Rg8cG3oiEO84O6GpvWlXl9d5aU3mZwHd9mUFH4
X-Gm-Gg: ASbGncvmybFQZsEdifdmG4NIUhihURzI65wdphkeiqXMvHG/Lggw+S4aNJtI6XJcrc1
	fXKDKlING8QwAgNAIKUciItBG38ThvFVphdvBzvkPdf37hXd1rAkq+cWp0J0ZSyR4F475axQS1w
	A7Siixi8OvwG1ZH16IOZi2YNXwmne0+wR7WcHRmzPr3QCYC54EDFf3n5UhxHc/hRruuw7mFipR6
	X20gVNVcLAzxdxXsa1kn7e486AigYhEp4TKdaBm3Mznycm953Ew2CBjw7mV08za550Nthuajekt
	lnkZU6OSAw==
X-Google-Smtp-Source: AGHT+IG+B5p77EYK1LoBu5F1XIZnC8CrYLs0zIUmDQzFy2+K6N4Y//vNYkNUEqYoj6ToGxM8dMC4pQ==
X-Received: by 2002:a5d:6d02:0:b0:385:f19f:5a8f with SMTP id ffacd0b85a97d-388e4d2debcmr548305f8f.4.1734482059454;
        Tue, 17 Dec 2024 16:34:19 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b287sm2365625e9.29.2024.12.17.16.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:34:18 -0800 (PST)
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
Subject: [PATCH 2/6] arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
Date: Wed, 18 Dec 2024 00:34:10 +0000
Message-ID: <20241218003414.490498-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 7a422e9ad29e..f4e865b534a3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -132,7 +132,7 @@ soc: soc {
 		ranges;
 
 		cpg: clock-controller@10420000 {
-			compatible = "renesas,r9a09g047-cpg";
+			compatible = "renesas,r9a09g047-cpg", "syscon";
 			reg = <0 0x10420000 0 0x10000>;
 			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
 			clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


