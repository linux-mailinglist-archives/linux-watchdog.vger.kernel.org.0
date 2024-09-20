Return-Path: <linux-watchdog+bounces-1994-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F8197D713
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 16:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D7451C22FAE
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 14:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A619717BED6;
	Fri, 20 Sep 2024 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+raH+en"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314BC147;
	Fri, 20 Sep 2024 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726843961; cv=none; b=ZzGYm89IVpWPdScxKYo6FDspgkJt+XegFZbt7QnBFDoCIQHVW9Yl2OcWbMzG/qgIppl+P/DMHyhAuAw5gb3jcGBWYmzEq183VcHfQlGgwD+pbmvRIXagqEKCmeyRwRxch3y1sb3rI0+5kaCVJiedgKtF4i93zbelTONrj45w3LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726843961; c=relaxed/simple;
	bh=zj2/kCH9YlrgdIqZoB33422bwus3qpZj7Tm0cCISCII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2Sj53p2/KfpRGedL+YkWWTqxTki2CojSAJ8zH4C44i8daesaBJ8P1GOx61yCtw5vUB0TOTLqh24T+RScFvA3uMzaKxD3FcUtlCKDSe3q0ngOBTACc4SQbQxbznpwu3eB5MdjElgFOFgfCEloPjoEDSlVqyQjMAAzXeSomEnFdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+raH+en; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718d704704aso1780234b3a.3;
        Fri, 20 Sep 2024 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726843959; x=1727448759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gB9ffN048M04ImE/bxyA1QZZn/yZ6B5bkK640TSTD+0=;
        b=i+raH+enQM7+jLlEBvCQju6IlHy9P+QhICEyxi3o5GuPn1VBNcrTjweHhUuV1vNfFr
         WsGimD9xNSfR4YANgPrnUHOKFSGnPvRNkC0Gjk+LeXIoppJfCXZpfau9zwPcMH95n0kr
         zdnlxOD8vdGL59x1x4V0DnHnClmrXhLg40cL0WTxDffUJ//e8QR5vb7yuSf838sZOzeg
         VVu7qjuiz3eAgUCQWNPqzhc9kaeWimUXcsTFhXZnn9IxQXc6UvO98DFg0M847aAMxpVW
         1MerVCqqapF4VSozSZWo7ZuKF0hEBZJYymBkC9P5XMOniAg0H0dDsXIRvH7y9pRu24lH
         1P0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726843959; x=1727448759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB9ffN048M04ImE/bxyA1QZZn/yZ6B5bkK640TSTD+0=;
        b=IY8yfmwlGWcVzE15fKqIkBmPOqd9PrhDZCNJb+uLG0B0i07GT+YPtIABpSZXFpg8s+
         7H8JbrIeHK38TrL29UBu9FkWoeRBFVvrDoUXI9UK0v9q0fOY+DlntFcrXKoaBnqFkQ1D
         QzHp6+QIIDB45sJ8f/fMVlec3F1+Qqc6ZoHj/Wcowo3kwizC8Xm0x/DEhUibdTvpNDL6
         A91t2RkghzNzKwURRj0XZDDrtbk4TgW7QpVwnOhaxNX0t9NX4QHfidmi0xxb/17Xb3x+
         2lzuEwQJ9VCiWcXDCMZP5K8+7DfYdM9lXYl/GQj1I/GtVDrlgEMvon/rsp2b1vm6hijT
         lsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrIO4pVjvyvtimiFQWZFwErwrgnD9whFKlkbj6C0DZ0P1qU5nNnd+zw3KFA1Ppn1iS84xRji/Pj3q4@vger.kernel.org, AJvYcCWnbNWUq0yxUGVNu0m+VfRrO1sALE5ILHaOcuqr2C0RI88NCDYHxzAvUfYw2se/DCJ+Pj9G5lgO/4t27db1@vger.kernel.org, AJvYcCXG2NQhL7gXhdCASy8eZnUL0LcurgpiufQnXeJLqHMAwWTTPp+UAGZtJ4vGChYvReK7sGe+aP66pheY7/SgOA==@vger.kernel.org, AJvYcCXNwHtUItN2+M1xwUvMop0mR2eTIUJ3lRBpg29nq28u18gTMKRhyaWEvRiYuEiR6gbXEzB0nmn8AoqcZTLGbLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qA8VWNj3f5FIW6vZ6HOenMxdYRE8d0jOYzbpWXhpuwJdRse3
	WTsiFXKGrtYPbdrDax0GOUIkd9LxYp7Q9FTJ1H+0Oc24IDOcaFzD71njgQ==
X-Google-Smtp-Source: AGHT+IGLD1vNuuK+Q3H41O6xw5iwjidmSuL7frNtZj4Ldq8hKjRbWG77JSrDTBZ96z8PyJlY6dwgfw==
X-Received: by 2002:a05:6a00:8d0:b0:70a:f576:beeb with SMTP id d2e1a72fcca58-7199c96d36dmr4681912b3a.15.1726843959001;
        Fri, 20 Sep 2024 07:52:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab502csm9923983b3a.51.2024.09.20.07.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 07:52:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d18d958c-d3b4-4e3c-a3f6-6c50d360c046@roeck-us.net>
Date: Fri, 20 Sep 2024 07:52:35 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: watchdog: Document Qualcomm QCS615
 watchdog
To: lijuang <quic_lijuang@quicinc.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240920-add_watchdog_compatible_for_qcs615-v2-1-427944f1151e@quicinc.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240920-add_watchdog_compatible_for_qcs615-v2-1-427944f1151e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/24 00:11, lijuang wrote:
> Add devicetree binding for watchdog present on Qualcomm QCS615 SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>

Reviewed-by: Guenter Roeck <linux@roeck-usn.net>

> ---
> Add devicetree binding for watchdog present on Qualcomm
> QCS615 SoC.
> ---
> Changes in v2:
> - Collected Acked-by
> - Rebased patchset on top next-20240919
> - Link to v1: https://lore.kernel.org/r/20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com
> ---
>   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 932393f8c649..32eaf43aadb3 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -26,6 +26,7 @@ properties:
>                 - qcom,apss-wdt-msm8994
>                 - qcom,apss-wdt-qcm2290
>                 - qcom,apss-wdt-qcs404
> +              - qcom,apss-wdt-qcs615
>                 - qcom,apss-wdt-sa8255p
>                 - qcom,apss-wdt-sa8775p
>                 - qcom,apss-wdt-sc7180
> 
> ---
> base-commit: 3621a2c9142bd490af0666c0c02d52d60ce0d2a5
> change-id: 20240920-add_watchdog_compatible_for_qcs615-eec8a8c2c924
> 
> Best regards,


