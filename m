Return-Path: <linux-watchdog+bounces-4205-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053DB45BCC
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 17:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F13816195B
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 15:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D8A306B3D;
	Fri,  5 Sep 2025 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtLaoeuO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70742F7AC1;
	Fri,  5 Sep 2025 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084514; cv=none; b=r8AyGacHYgHT89ElrfgeMtQa54rKvMcPzmYn8ZAUJjg/rwQv3lFCWl5Y5o9AOGV95iONPcq/L3ZQLxKAZsGPAMlTyR/6WNCjtPl3ZXigrm8UbM1MlArerqXkM9FWVwfMJLrSVqil4blxKKNiA3Fr4LZEjdD/vq+aPfqhtzAwm5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084514; c=relaxed/simple;
	bh=6g49r1WfDLr2gJrcBJ2bSggSPIdb0X8L7J3xZ/uvUUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgbhDefp+tk+YPc6Vde2X3FPgBaUNuW/erPihF7xQeUkpAhP++3bsykliZ5eJzlCpeRdkPdYsUuj9xkK9N2DqChWGJmTiNboXlSDjr8kOlukQoQ1T+M8T+zIGbLvCjoZfEgEC8CSJIddhfLb4qSlSQU0q2P9XPjh46Fs1u84ook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtLaoeuO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7722c88fc5fso2073951b3a.2;
        Fri, 05 Sep 2025 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757084512; x=1757689312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v5NpTVLv6KeF4StwU0LUhtXKywArenU2xh55ACd/9V8=;
        b=DtLaoeuOHtafdKb77uKCGmyp+8+88o6AUkQrjNFmRFaQUJG0no8eBfj2/OXeU2ccFy
         WJ9XWr+Ai/U6HkL4zwf1vD9xAOoQmxOB05ITjvk3uetfYSp9eSrfGZyQd3V6CkWj/gcA
         O9eHGJ8WkvT2NNBRN/+DpY041iPTV2l4KjNafj2OyqY4MCzDFQELaPuIPMSXqYUBqzXQ
         apJrI4+8PkZuSHDik6UpbbQNGLuvfcXKU3qHTJVIMwPvndsVd/n+xi99E1gDRWjE2zyN
         +AD3YJYXFz4391OvpD8IghoiltukjSfjzsJhVyNVDBw4aolOHUIIJOvcXAXro03ruLcM
         mJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084512; x=1757689312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5NpTVLv6KeF4StwU0LUhtXKywArenU2xh55ACd/9V8=;
        b=N2Tx0PMJRX/W1zXoCw/jKH+IlQ23M1wTb6LUCjDcBuesQJsmHJ4chl0ApE93zo7Ta/
         eHHBXh2PoTJaIDkzBWBI5mmNGlLWYExmXSSonhB+ki7Q6SXYxSYM7xwRfJ6N5loEBjfY
         SaDivGIQQgno0Y6c2dtxnwNYQhk+cJ0X1obp4G/uF3OrPyKy2I/G/cTka81iW2KR6RK7
         vMSvgRW/US0vcIEGHbNS8x8qtX/cP+a+LRc2oUqHem4igfh5/g2C6oTAploda2N6ZT3u
         3xy5ZN0F+Gbt1jjE5W8NKbOMqdk2r7mNnf8aKR0/B1N0Rwxk112i09PSD91y/xNczLpI
         q2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUGtVbUNfyyWsQ8XhYiCdpsKAQaaQY9mouKqqZDY+NmNozV2Va3IwLvgH7Jg3Atgjih4NFbwXVKqTy1@vger.kernel.org, AJvYcCVfSF531QD/AYRrqmg7n4N4EJvycTK2GDzJFX6KFlYQajal+3kb1EFR6ua63bbuUyDp/QRgH2XtQTxyahseaYnK+nc=@vger.kernel.org, AJvYcCXN1wovnuzs18IHwmc/ZsZyHVgkZpKdM8u5/8PElaFD38K2O0nSMBxwznF0bD7Rk+l0e4aldvwzP+exayn+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2FV097iDOHXTSNaDDotg3dGLDUwibwFQ/iRQpk1rk6Lobx3I/
	sIaSjmTQWBZIPI+4V2VkeyEGpbZr5d6XMEYj3zcq1QlIVS4S9FjtASZR
X-Gm-Gg: ASbGncuFhRsjYMTb4wdpCtTukMmN6pr+g9TT6gNKycs4TK17qcpvdM/Ab3o/ICvHHph
	ovOq25fBVj4eYxYIRg7IQy3Yqp+2t9//bKLnXW5DEcCukdRop7WIBpaEjSGgmWv0wmeso2uumV1
	tvOLuGv2KuoM2/d8a/0jUIktHaxT45z6EIjkLF50pB6Pm06AKyE7xmaQ5ieQcNeRl9DWzQDgSbI
	C/7TuBswEPMSkDYfJ46L4PWWi3fuNnQDtENzPSlQJMGFr4R0iUY0mSX/eTIX46nfN4kFW9wpd5l
	ClXGnz44MxMBoTa5tAXBhKJHtfiR/b0KR1c5AaRDAkg8gmzrKJWHHGvwDq6hyd1vrDwf8CZqwZL
	ywMbBx5Be4DRI8YUbU6ksGq17CXkZw4ScAaaEmrUbdz7v3r19Rd974HqiZb4xofBV08MpfGchxK
	q1nJZIsA==
X-Google-Smtp-Source: AGHT+IHjUXQX+11r322qAU0woyUZ4rop33lW/UHzJXz5HZBwwQNXsRwUGFfhRlx0Y+S8o7T/gYBP1A==
X-Received: by 2002:a05:6a20:7488:b0:240:1a3a:d7bc with SMTP id adf61e73a8af0-243d6dc873dmr31209889637.3.1757084511507;
        Fri, 05 Sep 2025 08:01:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4e5684da06sm16482310a12.17.2025.09.05.08.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 08:01:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5e36cc05-1084-4abe-b3b1-fb54ad0318da@roeck-us.net>
Date: Fri, 5 Sep 2025 08:01:48 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] watchdog: rzv2h: Add support for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250804195723.3963524-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250804195723.3963524-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/25 12:57, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the RZ/T2H watchdog timer. The RZ/T2H requires control of
> the watchdog counter using the WDT Debug Control Register (WDTDCR), which
> allows explicitly stopping and starting the counter. This behavior differs
> from RZ/V2H, which doesn't have WDTDCR, so the driver is extended to handle
> this requirement.
> 
> To support this, a new `wdtdcr` flag is introduced in the `rzv2h_of_data`
> structure. When set, the driver maps the WDTDCR register and uses it to
> control the watchdog counter in the start, stop, and restart callbacks.
> Additionally, the clock divisor and count source for RZ/T2H are defined
> to match its hardware configuration.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


