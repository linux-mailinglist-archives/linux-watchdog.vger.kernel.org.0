Return-Path: <linux-watchdog+bounces-1215-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8519691EA6F
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Jul 2024 23:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AF61282D15
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Jul 2024 21:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93237171086;
	Mon,  1 Jul 2024 21:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXpFW7uy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276884A5B;
	Mon,  1 Jul 2024 21:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719870112; cv=none; b=hCDZCaTjZAb66eWdKU5q8eD6NaKziVtiTd0L+6XbqCUhafXNeYVndqq2BXya45sO98kooH/S/UpDYzJgHw99GO/rJgE5b7WRdj9O20IMjhQuYzmNcQcgROowKsVdCXOZjDhI/9oycnEJL6nsvUgf//QIR3NGqYcZZcv1knBlr80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719870112; c=relaxed/simple;
	bh=LBz/lrpTHmXVzKAokJn8IdRsQRBqQ5U8HejZfcWLTyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKvMFItAfCWQnnI/NDQnB4u2jogIfzvHE7Pe9iDTCMYPgK2v8PvMbYihlfWOPeXN67rua84A2poZ96xY5KtTmUEuqac3eSYbXltUXTdkpbzRrwOcP8GMjMJzrpmgcAC2JtzgVhZRGkIC9b8Ngjka1Ok8XxKxO3/TwVssHFjU+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXpFW7uy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fa244db0b2so25786245ad.3;
        Mon, 01 Jul 2024 14:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719870110; x=1720474910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jYwPqVMlZdLOYZkshqEqznREeEy3sBWbgm7YlPlBBPY=;
        b=FXpFW7uyoF5tFWFb22og3i50qXKEho6lRx8FyEySbkPVngeytGLGGTzv2/T+uc/WQ1
         r5asAye4YPS1GEHPE/ciPuTdV+TmUQmIbU36IKl3y3lkypWo2ruJqmDSoyVzUS/Jzsyn
         5cYo0/29cfJvNZ6MfV6I01JVgdQcbFFCfDKGa4Tck+L8CwcThUKN8ihmM0AOcBKbdQQQ
         6FkgEp6oTSyjaSNfxAvPONmSYBuFVTzWUSy3aAkVLw/uxC4cZAq1Wrk3z/qhA/vnmrL4
         gyx5H3JR9x+I8J1Ztzarh2SHXFoPwxOBYss5CAbP30lqTZUzRtjCOcwpdjPyK9ka3nhe
         VPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719870110; x=1720474910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYwPqVMlZdLOYZkshqEqznREeEy3sBWbgm7YlPlBBPY=;
        b=Oq855Yz2D0UNnzffAvHE3jHgAkjzuiJAlfFQbfV+1ND+7XfhH3z/cml4jb7lHutxMi
         S2Jsr8sSKxfduEGHiCk+3XEkDHmT9wf+5WHf8NmYD7sf6HOlUpNOnF8+Nvr2FnERMDnG
         UBPojjeu0WQ5hhWJ4XQ04IzvW6TmSdp/GH3DKBvV9g5Mvi9N1cst+A+YrRkT/0x5/QTk
         wBaNg4LOcRXO6pRGzOiWEppIVUG28EtI3EzR2SuKiatAUHEb5wVBh51aVMZL9XR20GI8
         aSyf20SLMBzr3agwOXL7JQiyzKmarcJIxBSMFzmInhNmlMhZvSOUZD1LR7rfSozDa+lY
         mj1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNvmsnhgjInPjcsRcF26Epr3nFnncY9KBweNuz5f7MFl0fCWpz4COiNfmejZhAlRTztAM3Frud5CBtL6lveMdS9D0rc6/fxcOLlBkKFQlYwKOtIWWxNotoX8AUKlOiXedhQHy4a9tGgoTzYM4VVLx6bDI5yZs5E/0dgWCDLjn0I+Yp99tzTy0W
X-Gm-Message-State: AOJu0Yx5XGOARyIDlQsfF94yhJLFCs3R3tzrdvpdE++Qvs2cdt8yAxV0
	5GVLHP79KdOe48pw3Phz3MsCBVGVpknvMTVMREmxAkwIqFOUiiGo
X-Google-Smtp-Source: AGHT+IG55lC28qsQ8KKjlsvMs3Wl2d/y1QBubFLslIxhTHTjPaX80xvnacLzEdb5227vKwUv2rRc2Q==
X-Received: by 2002:a17:902:e807:b0:1f7:187f:cb63 with SMTP id d9443c01a7336-1fadbce9d33mr40879195ad.47.1719870110255;
        Mon, 01 Jul 2024 14:41:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ec1sm69898225ad.2.2024.07.01.14.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 14:41:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b0017642-c505-47d6-b8dc-885ff24f202c@roeck-us.net>
Date: Mon, 1 Jul 2024 14:41:47 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Add missing include for FIELD_*()
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <ZoJhQVF-U6sSJ_Sg@fedora>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZoJhQVF-U6sSJ_Sg@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/24 00:56, Matti Vaittinen wrote:
> The FIELD_PREP() and FIELD_GET() macros are defined in the
> linux/bitfield.h. Include this header to avoid missing the macro
> definitions.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406300817.hcJ9VtLf-lkp@intel.com/
> 

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> This patch is built on the ib-mfd-regulator-watchdog-v6.11 tag.
> These macros got included via some indirect route in my build
> config on v6.10-rc1 - but the lkp reported problem on some config.
> 
> Please, let me know if this follow-up fix is Ok or if I should rather
> respin the:
> https://lore.kernel.org/all/20240627082555.GH2532839@google.com/
> with this fix. (I don't see much of potential bisecting problems if this
> fix still gets in the next release, as the watchdog code is behind a new
> Kconfig flag - but please let me know if I should re-spin whole series).
> ---
>   drivers/watchdog/bd96801_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/bd96801_wdt.c b/drivers/watchdog/bd96801_wdt.c
> index ff51f42ced2a..12b74fd2bc05 100644
> --- a/drivers/watchdog/bd96801_wdt.c
> +++ b/drivers/watchdog/bd96801_wdt.c
> @@ -5,6 +5,7 @@
>    * ROHM BD96801 watchdog driver
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/mfd/rohm-bd96801.h>
> 
> base-commit: fcf1f960a6aa45a22efd4d49114c672ed305b85f


