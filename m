Return-Path: <linux-watchdog+bounces-4409-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D1BF2F01
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 20:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68F2422D6C
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 18:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949093328F7;
	Mon, 20 Oct 2025 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma+4cd8q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D243321A4
	for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984977; cv=none; b=fpdwMCjdg0bwDUjB4FoY2twKjQRaWjtVeQPgyfxdaIHloufpKpJmyLjgo+LQHp0otLWK1f8zh4yHAQ2Z5FS8vuLG2B6dvOCnNrQahPXZBnbdvtGZgVMwgkBO09pcx2Ae3ho2yG8lvRbKd5/xUuuefX6QLKVCtGveuZtsKEHcxuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984977; c=relaxed/simple;
	bh=YnkvNEzzrCZ2F2mwi3Xyfy1PKyGDWUGjXjVlFN3BUYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfVha/gkX6tEsgPbvomZ+wL4CPPdV5Gw/XMDityB+OrEVsiIij4vrYKD/+lt0+iI0pNJUaGJ2C5ti82R31gBKwWp5oTX9JoaZIMmX7MEJY6Rf3FNrRk3gHPEWRmCqMaXlqpuYb8Q8Emt1HfK0WGKJPRgAhmwaqG1Xuh8UhV3fSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma+4cd8q; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33bb1701ca5so3914558a91.3
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760984975; x=1761589775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=G8S3WqjIfqedzQFzCR1LzIz7iLwesKjYQf37yiEbhNU=;
        b=ma+4cd8qd/iXqkDBtfbtfYFATRR7UQG207GfSPnb53P0QBMe18ie4xRw8A1lhmFMSP
         QbCIK1iEJyyHjOhXB4lOT78IZZKOpYYUovbMEZGe/NNAT9PWBazVK4oS2zfc7EgsW7nK
         NL0VBVCGbbBnIaMA1Va+HbfH7TbxC5mCBLWIUEj56VDmClCTXo9H+P2rr4Xo09M1SxxB
         tvsWRU6/pEofhuv2woCq3F8zQB9SSSwJSUEsZGovoTLlq6c5zZ2eF7HvcSuOzjKHaMxL
         yv2JlQzwRaMshOKTSG5xXv92CZebGkwxvw6U94RZaogerxoF3oWZILj/AlzmUYyUdVLK
         Df4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760984975; x=1761589775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8S3WqjIfqedzQFzCR1LzIz7iLwesKjYQf37yiEbhNU=;
        b=pW9SPXG3UTBeo/gtjf0rcXwIypTWvew0hE9HAYph0KIAynUMSOxFL+1lfLYZJ3oBIv
         d44OErMHYVgI9maktQi6lStdPFEMQrJsuPDcPI9P1KQVJXUPuNk44Ehq2Q1kizl0iySJ
         1KjDm70bgYHTLEyytjHmtLQMoklL9JIeehcE9KXdHAYBpgNf1K7o2N4CwCtXiDmSsZCq
         EmmVLtWGovxwT9Y3qWpWRBZLK3RR+zPJAgtmCXMGH8kGr+BTnrtXxcWk46EXAZKKDer5
         +PvemhtPjTm81hCJEVe5ceFWv8ymCji5jpuJoQzhxszH9OqrUMBghHgpdT95UZYrhdF1
         z4jw==
X-Gm-Message-State: AOJu0Yw75ODhJIJH0WIwCLkO2vP9RBsaZZHV6csl/o8c+S5FnBmsyg/O
	GFaN/I4P8wLQTEcR+dWXrKL1EEZO+XbNxVXnLIfl5kT7iBRQPr/8+Es8
X-Gm-Gg: ASbGnctUKb/zA3JxJ3x1gcc4j3DzVJRVKy11ZQv28AUC6FbG/Q4NGjoKoNf2cQKXUw/
	jSo8WBk/eYQD8GC0OJDbzI86kmv4xGGQ+StK7BKxvdghbeSxZhwu/WuWK6Qg/xLczxWHNDwf2lR
	iHtifHcLvIxkmRmPGFvaep5fQiB6pGRPZpHAVXe05VM0/VRZmPJYFKtpsl25SueRdyNHE+L874k
	apj4E8ujNTBP3mXhKQgtj1eXREyQP0QAwNpfFbtEAcJNW5axmtE40wrWG6JSoN6jNPXdY4zRVSH
	QAkJwwBN5iJ/Cyl5fnVUW5/lNVJJtNGVKtJHBwCFBclW53J6AkIVatACu/TpY0QQD1aVsEmwa8R
	VvhR0A5XcnT8Z4Ve8o70KzgvMclfGdpxGYbJ6D7ANEnE+kNAg1sl5kizTqByxhnmaIm2qxXr0Ar
	2hr+5apjAsml/V5p308Bb6TAckPQ22gruJAl+LEH7s+d3BuQoJ
X-Google-Smtp-Source: AGHT+IFTq8qMNsiqU66jWDQF76YmSGgemaihg3w3pVoI3B5QClfDbRcDke3uMOzrWzlJXeCZI1IGQA==
X-Received: by 2002:a17:90b:3f85:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-33bcf8e5ebfmr19897472a91.23.1760984975158;
        Mon, 20 Oct 2025 11:29:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5d00c909sm8578734a91.0.2025.10.20.11.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:29:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7cd3e303-6e20-4a84-8c91-cb20c1f209b0@roeck-us.net>
Date: Mon, 20 Oct 2025 11:29:32 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: mfd: rohm,bd96801-pmic: Correct
 timeout-sec length and reference watchdog schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
 <20251020-dt-bindings-watchdog-timeout-v1-3-d0f3235eb327@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-3-d0f3235eb327@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 09:52, Krzysztof Kozlowski wrote:
> The parent node of ROHM BD96801 PMIC is also holding properties for the
> watchdog, thus it should reference watchdog.yaml schema.  OTOH, the
> timeout-sec property is used only as one number.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> 
> This depends on previous watchdog patch.  I propose to take entire set
> via watchdog tree, with Lee's acks.
> ---
>   Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
> index 0e06570483ae..adb491bcc8dc 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
> @@ -57,8 +57,7 @@ properties:
>         - prstb
>         - intb-only
>   
> -  timeout-sec:
> -    maxItems: 2
> +  timeout-sec: true
>   
>     regulators:
>       $ref: /schemas/regulator/rohm,bd96801-regulator.yaml
> @@ -72,7 +71,10 @@ required:
>     - interrupt-names
>     - regulators
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/watchdog/watchdog.yaml
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> 


