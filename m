Return-Path: <linux-watchdog+bounces-4028-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD12B2EC73
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 05:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3FA1CC4BBB
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 03:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB592E8DFE;
	Thu, 21 Aug 2025 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLga+w5X"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902F2E7F00;
	Thu, 21 Aug 2025 03:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755748331; cv=none; b=lg5/krCfxdFv+QLSkd36Sx17HC+aGnmyfftKgWARIB57phrxpbMSMRdJI5oR6NYd+6uBbFwpbRiof8jwAI+9kiZs0EUEF4rRDsTJO5YTYBEs0GcCr56z1Hjro/NRz7LWnJIRHCSCYhkGhtDr+V8FLKDGHc5Pc4gdEl3+4MuGevQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755748331; c=relaxed/simple;
	bh=HO+iKLe8HlT2pb6fd5e3H9BdROezL8fWqlMIHvgy/Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUzDV7uZRY3OeD2Wp0dg7vWPVCrc5HsCKhB5+DxwgR2DUGwiJ0ZPb2fSu7Cgnvwc72bPtxTvrAdN4kkMvK7/n/LvNFAaCCzNtxrzOM9ja4tk5EEjmlicpG3+hdlzUrNf+yomqDcm+AkHUnODQafDPVgBZsvRphwQuBsI9+XFg7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLga+w5X; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445811e19dso4479145ad.1;
        Wed, 20 Aug 2025 20:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755748330; x=1756353130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JyMYwN8hLYvWAiCmCjc2sLRiji+vi2/IY5OYZOqnCHI=;
        b=OLga+w5XJaM9XA3vIJ1Sh/E/J9m/Zku1x9XrppoJqV42//Sc0FUhKOSgl9MEwnuCPv
         P2GJ194qzggm3DvrHFUfRV9F+LmwX6S1qCz9F2BrwxLBg3fphkUc2aTtRGpXlLhF62Vi
         A/qWJNhOrka9ck4DuUGam1tlUDj+QrI8x4HlfZcs+839cyb4+5EIAOowMMe4RUAaVUUg
         xGLVqPWyKs6Ly7H7BHljjLCHMSaEyWcM+gCoOVm9vk2jd4W+5bQ0UuerqiQsG3OEGbbE
         YSmzNcrteC6jxg9iG8BVPglrHWvpU2Ms4LVZWvXhmc7Gmo9WJcvgWv90LnADK/snVznP
         CWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755748330; x=1756353130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyMYwN8hLYvWAiCmCjc2sLRiji+vi2/IY5OYZOqnCHI=;
        b=vBpnsWqDLOIZJrYA0MUDr9L6bVZaFsvojHdoxYFGsnDLxXAGej2js1NdxFsgtlKKhW
         01dwDGXrJ6rP6Pj5f5eSfm4MM3uozZv/Az2oVdfMBmoI58uL1DnE8Pewo1uTOnScTgIg
         FJkIaSc1iTZl+cJVWbNW73xHzZCKUKb0vwyheY9xorX6NbWuKG1t1+lVGmJ27TB2h/fo
         A+TtZj8+McK3Ddpkm5igVVuTwGbs0EXz5uVeFKmYw4c5uxmMKZY/aHKC+qQbYOcvzaEl
         kSWc2EqCFhmIreqQjSxxx7RUb8bg9RtRjP1tPhduJzQgHLgIgubRqVq3QKFPRLb73xkx
         MKOw==
X-Forwarded-Encrypted: i=1; AJvYcCUmbwoNhVeL11uzbXv5tEPuztrPQomrl2ghWcbkMI3QjqBZGnfWtURlgJWdsQ5CHS9JDiUmyPndtWKfjnjP@vger.kernel.org, AJvYcCW+2f84fZSkoLNN3zcBAw6w/vGQ20zyYjjz0J3GtIg6O3l0p6VGwW6pK8G46+3ASiXOSw5CHG/yLFLP@vger.kernel.org, AJvYcCW5cVSOc7tE3O7+sRCPeFBLzgvEebo8iyat9sSd5axQQQ508JxHjy4QX44xKckHJs231pCHrlF0Tk0J0Ima86moJ4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJlrQlkgmTybx+6M2b0d3PofF5KlZQRYLNS6Z3zzDOdGYHZru
	kw56tyPibU/Zin/8gX2sj3Vm22WILXJH8jRendSjDCX26WqrE+KCuRKd
X-Gm-Gg: ASbGncti4Hxv5qNf9EK7m80IFUPNZXcEoIxWFJPhk0I5OF55DdxW7xb6x1koXRovR02
	xtbnDASg6WRIAph4mAcuogoBnUxz8rKOeku45JkPfkvoE462jkEJEpbIteexJuK5b53/agp6vhy
	NVCn6Y+QWlWEVpM/PM3GSw62FDUHglUCO2rG7YCpfShAXVI9ZIUEMW9oRP/tWPY2fVr7VeX+QS4
	RmSydJW9zf03pyked/aYLt3aUiOZ/zThp1fK45JrdBn7WudGf+m1GRaanJB7b12wj/lozDq3CMe
	SbgQd3GETcQPyGY6X/TKyBil/4QC2I2ClNGE89YQx3sp0osjfasufBhlh3yAthwXdN1stJZFmdm
	vDGA6UKZDA738oStr5f9a5kOchAx/ripZ+QmFoNwnuvkvJc5A+3EyNcKTVHSuFxLH3GF+XzM=
X-Google-Smtp-Source: AGHT+IFdrBOlIZ1KC6ZocldPQNsAuSVc4siyM4M9qVomvcrP+Sm16xq8ocBgPOsSrRoaZL0c/B9wlg==
X-Received: by 2002:a17:902:f684:b0:240:6aad:1c43 with SMTP id d9443c01a7336-245ff865cadmr17423075ad.48.1755748329666;
        Wed, 20 Aug 2025 20:52:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c707csm40992795ad.69.2025.08.20.20.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 20:52:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fa916e30-581b-4454-92b6-2c2614661e79@roeck-us.net>
Date: Wed, 20 Aug 2025 20:52:07 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] watchdog: rzv2h: Improve error strings and add
 newlines
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
 <20250820202322.2051969-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250820202322.2051969-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/25 13:23, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update rzv2h_wdt_probe() to provide clearer error strings when retrieving
> the pclk, oscclk, and reset controller, and append missing newline
> characters to dev_err_probe() and dev_warn() calls for proper log
> formatting.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

