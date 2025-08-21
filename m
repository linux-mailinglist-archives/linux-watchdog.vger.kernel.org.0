Return-Path: <linux-watchdog+bounces-4025-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A6B2EC61
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 05:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6D3D1CC0935
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 03:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC472E11B6;
	Thu, 21 Aug 2025 03:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPGZZqmF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E33D81;
	Thu, 21 Aug 2025 03:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755748275; cv=none; b=gujN5LRo2MBaPWnSMM5RVlySbXeD1lmORZMtbG07XAJcNW4em8tibWbwP8vvtvZSqWzuExY/hCFW7cjqANVfppReVUnPXaMh9srMCe+J8MP+DeKeVXmXQE+DjVSlWVgKuOLjm0lKY/k3cETByL05yGNCX5mlrNOqgD+nzSiXoSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755748275; c=relaxed/simple;
	bh=y3HgrJacXSy+3TjpTNLeT2q/nJUds4mB4iju+hwz02E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmthew3JaUjI1Ocwx44X2iXd6bXNLpdmLiRaxBcfbcahSBPb8KUcSNN2T/hCeC+trrlKTvVB8flKTxblhtFeOu6k1HjATM/TsZLVbA2Q+UUsAzt9Yf2u3h3M07yVqt+++hfoL/K5iupvqOZdm6kjvxoCAZAulDryMRCm293Ebb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPGZZqmF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so631988b3a.3;
        Wed, 20 Aug 2025 20:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755748273; x=1756353073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GV7YNpX+C4Cr//CFhW7waB4MO/4Knu3R1/dm3jX39yc=;
        b=MPGZZqmFUAfZ08X47VWJCXVFRalElC10bJQzwok0d1GifdBLJCW7BPgreRN2ZFPFXu
         NrcUbXlFHnKIk8GddQ90nd9pmlXyX5Vqoq/FzzuiHQ0iPePygG6Ewf42v73AKzlWKVnK
         /D6l9ThTIM4F6wVxQSuzpT3g/SOiwn1Bw439wuD0634wQN8MTLrWQLBnOpa+lTP29LT4
         t2s/dJ8bBDI2fAz2hRjTdNKzYjf5ibh1kORTyJyodWU+dpbTdW7Hh1NRqmCMviGiNDLO
         hl0DuZzPGCT4D5oOT53IWlU7GOybiMV5bRgO2oac+gVENGQFnUDHyVYLJaSYNNnTywS6
         F0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755748273; x=1756353073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GV7YNpX+C4Cr//CFhW7waB4MO/4Knu3R1/dm3jX39yc=;
        b=ssy5x0PSdRGtS63Zxpiyhi5vukX3I1J+0k2UX06pVYM3Qa+0RVrkBocJVDK3ae3Cxo
         sv2lWDW2Y1miVMRpAJZ/+5UnHVtLlZou9UMxTPkiZKEWLQXvA+FRd5lxWaY5NvMk3Mww
         SAbjE1n/V4/nrAG7I2yXniEP5UUCcDOLttXJ5WNvfGjG87u/X+emO0BT8l4cREjVQdSm
         8aVfJw5jaGR1Mc8FzUcjhYpU8UTe4Qy4I1gVHzebAxfD2EtkS9n9u354FxRjePBLPXS6
         XdoQX7LpTfuuKl/GHIAMPs8tB0hkapu9skxcPORWbVjAZHvQiMDBm1gFJA04oVhH+BYr
         3JNg==
X-Forwarded-Encrypted: i=1; AJvYcCU0rkPaXFj/gRkN18uZChdpQgtBTSYUWpenrKul7irn+cCmn+0ABakx1VjKbQvTx+ehh7D2Ek2HieanSVEb@vger.kernel.org, AJvYcCU8xmWT4qCNnACLBTKdD9sfbIgCALdmG6XbiAaK0y1TraOvUYFoxfKkHhb1bXOgmhNcWe7JfQIskyeLWcKTyTB7PCw=@vger.kernel.org, AJvYcCX6ZZS317zC78Chr5DHNWavfNUlh5vW7zhu5Deu3RlZwlOS6xN39cSJkjMvN+fdRcRFPyFCsN6b6w3S@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwC2w/B0RvFGxKZLuXQ1LtAoh+ug19a59RzA0BSB6porXd2sJ
	YB5oV0xCHXqWtfmRr/5qnbp6/Hh6SkLK7L+nH7hu70CKS+bRMjK9KGM+
X-Gm-Gg: ASbGncv4xUyPp8aNmz8EH2zX7QrGbf5sbRFieAAGTdEB9MOvCD35QVN+OWBYzGaI7FX
	DZjoVyYmpI1/v9aw5SmzZqs1eJpLhlBsEQ8LNb4ftnuHPrQa04dEdsNnB0O4eoYv8T7yFv0P9yo
	nRC/3zhxOuIFCtNoaNJn94iNu1f2aB5r5Bri6bIGtriNlWLGErl0hWP+2C9UHb6ETwTPtNrNPZX
	MbHCzddXsX+mtXhtmbp+kTizU32xLuGYJYfnbzOx1SaBHljYe90DPf6Z6fnsPk0FcaX5f+TJfzl
	4+KFpwMvSHIFfLMQvRrAPKjcPkLiuIuzK6HU+eHnJKEbeaqckRgGwVkZaMvOBfdoqyhrpr50Bqt
	0oN5Gb/wZhm0c3v0II+4uO6XO2FFtMhMUJzwap5+DtITPJXtfB3IWqi1s2s+k66kBjBImJpkOZ/
	T3aODNMw==
X-Google-Smtp-Source: AGHT+IE1UqvihypDlC3cNLgBuAGhSCkX+MhJuMp4hSJAY/pTWZTq3ZfGo6bhRrqZpCAaJrC4qNaALg==
X-Received: by 2002:a05:6a00:895:b0:76b:f16b:b186 with SMTP id d2e1a72fcca58-76ea323b90amr1382784b3a.17.1755748273518;
        Wed, 20 Aug 2025 20:51:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4fc0cdsm6644318b3a.52.2025.08.20.20.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 20:51:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1436d16a-2574-4ee4-9158-ab45c3c7b494@roeck-us.net>
Date: Wed, 20 Aug 2025 20:51:05 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] watchdog: rzv2h: Make "oscclk" and reset
 controller optional
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250820202322.2051969-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250820202322.2051969-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/25 13:23, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the rzv2h_wdt driver to make the "oscclk" clock and reset
> controller optional.
> 
> Use devm_clk_get_optional_prepared() to obtain the "oscclk" clock,
> allowing the driver to work on platforms that do not provide this clock,
> such as the RZ/T2H SoC.
> 
> Similarly, use devm_reset_control_get_optional_exclusive() to allow the
> driver to function on platforms that lack a reset controller.
> 
> These changes are preparatory steps for supporting the RZ/T2H SoC, which
> does not provide an "oscclk" clock or a reset controller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

