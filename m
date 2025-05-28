Return-Path: <linux-watchdog+bounces-3587-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16545AC6A27
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 May 2025 15:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 803C51BC1845
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 May 2025 13:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12B4286D58;
	Wed, 28 May 2025 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xDjHDgkj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13398286D4D
	for <linux-watchdog@vger.kernel.org>; Wed, 28 May 2025 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438263; cv=none; b=mHymVVzExFASlFpIaKsfVb5ANLL1dmm3l3whbuDph556cPfv4OJCJ5YWjGY2JSnLnFIFNHAnYvS7zie5bSklfqtY306CZgg/wPM1DI6onA4q5Awgh2n1k3ZOj3Jgi9DyM1hkq0Yifv8WHT1oT29ok1UtGPDA9Lz88vel60M8/w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438263; c=relaxed/simple;
	bh=+8JeJ0WuWhzvAWlP/eWg/yGnQ5jEOIHa1Vy8lkmwQAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhJ8+TV5efEY5Z1LfTE7nafQZUcbfHqw/CkuUqPlTo+43ZgytXQcqFDiVN/uG9tkVBlBRUjm6l4Z2ilzhfR8RYs0Ko1qsJwhodNQGiewnGdb8AWUqdvc3SFyzxAxqz6gwOwIIgVBYGRVWJFbWg5TpSbUpvsjRBhTYEGVMOPoZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xDjHDgkj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso27826205e9.3
        for <linux-watchdog@vger.kernel.org>; Wed, 28 May 2025 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748438260; x=1749043060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=etuOIVUU4x5SySaTzeLNRaqDZ3hUnhSaZPYuWZNFHOo=;
        b=xDjHDgkjiAQIndoaIzHn1Uc+K0cJAoizjAHQicY87NOfQD5c0YoHvu2tbGQdjCruNx
         7juAQuxEPoyLd5uIIDL50t1opayQZ0DtZ66rjInnvEqIAIEQoGY0124sRqZVh/cwfdMv
         1mUS5lWPJrrfAiBIBaOKCjq3crMOSgV8Sl65fmW4jabg6Grk40B3m0cOvA7Ox8AL/8j1
         FRnuOdWsBfMooh1W2E5LlShZsquGXCuxCw4j+LWxBx1qtA+zsGzcKaeEfcezWW7Vzhpj
         FSvM8A5AiuVALahUlTILjAC1SEq+rwfKfQ12arGDcIqsNGlb/g4eQEb6U5nKraJQPQXE
         oQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748438260; x=1749043060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etuOIVUU4x5SySaTzeLNRaqDZ3hUnhSaZPYuWZNFHOo=;
        b=UM2Hw1UiY0zTUYkotxtaHSo50AO0sCM9WAqiVDAdrB1+caS5f2ouT73zvE6TvnFAIA
         P6qlQAO5vghlZgfnXIXZ827t1qgVhVw6dvDTw4a60yRZWzKuW8VNjqxVdJ3cmpI7JH4e
         Jog9iAJQAQafks8eVllI9yyvu+5epu+xl81kyLJFJBIwdaBgyuTW2KUnXuA16xWTdtxl
         qwAQkdsqWKraO3w1s9NOjUpphUlpt7mattKXCvC7Th3n3BJO5K9H6ZK38g+Zn79BE2CB
         bbo3nyRqKjwyLlh+FJBs44vchx3+YRLgNZRvuVFZKy6w+35Gu2z/86+8DfbCaNNMhHiN
         DCDQ==
X-Gm-Message-State: AOJu0YykHYl7rhjq/8mv/H009KKuEziECneKj7YMqAfHymbXAHb6VmAV
	VhvzXd/Jf2xFsG43B7bM7VVCujFBc7Gp02FclTGtpmYR4YdJPK0TCjHW37KC85JrZMY=
X-Gm-Gg: ASbGnctC4RtwZ/JZdstedlqfaxn+7DT9eImEHh0k5xhHaUQnhForUS3jku4sA+48n7o
	BMZ/apI1a+sgpMnb3aH6klfopN1kFWCXsSw2caudHbcax7wV5aCMy09PWEDaxKsERQJO5U38N+S
	GXvoFWuiL4np15/FWAJqYY+wPGBYQ7Xl062LTL8OrIfKJ1ERY0zu3WaceJh04a9JFkS1BujkF4y
	Cn3RRiPcq9zhiisnuWjjevxaMetfYzzHt6z7cjxn0nM3qsJqrqiZBZFYVrD5RelFGCNpTc8qm3k
	E014HGPeIibW+2QlQdCnEiIifUOXqvLj5A9/RYKsOvOlFTDGH/x3VbGMyy8QB3DVt+MM++yWTLb
	/Su8Nx00tqh9wsdZ1z0YpK9N2dA==
X-Google-Smtp-Source: AGHT+IF6k9N6RDrHL9CWqquYKN5znltPLRFbYrRqu24xJR1k0tX7fObXTd2EmsKCVpIINagQQXmgGQ==
X-Received: by 2002:a05:6000:4308:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3a4ed1e40c4mr749522f8f.46.1748438260235;
        Wed, 28 May 2025 06:17:40 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4eac6ed4dsm1509868f8f.17.2025.05.28.06.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 06:17:39 -0700 (PDT)
Message-ID: <a6d64948-e713-4a50-9d4e-6de02a550d06@linaro.org>
Date: Wed, 28 May 2025 15:17:38 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add the NXP S32 Watchdog
To: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, ghennadi.procopciuc@nxp.com, thomas.fossati@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
 <2a8e1ae7-2a8a-4cd8-b699-c010019c766e@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2a8e1ae7-2a8a-4cd8-b699-c010019c766e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Guenter, Wim,

On 14/05/2025 20:09, Guenter Roeck wrote:

[ ... ]

> AFAICS the patches do have Reviewed-by: tags, so this is just waiting 
> for Wim
> to pick it up.

I fetched the watchdog tree and saw it was updated from May 23th but I 
don't see this watchdog series.

Is it possible to give a status about it ?

Thanks

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

