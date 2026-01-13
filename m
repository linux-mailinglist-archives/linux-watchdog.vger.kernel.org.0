Return-Path: <linux-watchdog+bounces-4805-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDBD161E9
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 02:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 039CB301F034
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 01:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7700126738B;
	Tue, 13 Jan 2026 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJvoLo1g"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8321F0994
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768266952; cv=none; b=kgqL/FgqVNo+VmWhIqztFZj1oOrYpKy2wC+YmNQ51p+wfg47ljacU8zbRs0PyAiq+d9McOPAFBuxhaEcve7xcb2Blw9eyvz1hVHOqa0eKES3jszuAhX5sSZfWgju4ncr1RUyo/1bQORcAGkQLNKUJ2jkaR+Dyhq+c/yb4p21wSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768266952; c=relaxed/simple;
	bh=gAZgSlkiYfw5eyUhzonXkubJPtzNocvWYTcK/lgE39Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVGb2tSFwnsBfCfaCrqXOkMCWN0tPdq5N3vMSa57SsIJWBZi0UbVp/DGd9xcV+XvVR1KKP07gOxcoriCNHlCNPOGQoDe2ds8RVU+Vk2cmYBTOhCRbEysR2gbN1uGYH5JxNGNc7nrHmSsvoOX9evAH9SIMzpaQ9xDjVg8yVX2U60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJvoLo1g; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso8731028eec.0
        for <linux-watchdog@vger.kernel.org>; Mon, 12 Jan 2026 17:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768266949; x=1768871749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Xc46JlJ8geJJu3FFFqsm1fT7R0qCgtyg3WaAfisoecw=;
        b=TJvoLo1grwExGEqRlcxlQhL6g2pd3emdT22iajWBIzmSNKQILo+EYcyWX8FPsaV8k6
         OKqDJsIi4EfolZ4r8jhBBpia+fZpTAodCS9qm25Q8+8T2sWIchKo3MEAz+hBNedM25PP
         pEuKOPlb8/8nWlz4xdhV1SG9SGoeoJn0oyc3U0IFvGhpnwzHY8Gnc05NxQgbq/Hkxr6j
         mCRqoee+OtId6algxWARIpl7C2QXxuecMvqz1b4a2Xdx1qHL5z+7VaXnT0/ITYFIXatJ
         8+qZzDrsjtIciuAT7tbBnCjiiV+TtPNDkudYeh8VR76A7Ze5VU07yL495XdWBCZeRrLE
         JwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768266949; x=1768871749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xc46JlJ8geJJu3FFFqsm1fT7R0qCgtyg3WaAfisoecw=;
        b=mVl6xxvPos+PVCN3LCYwNAM+XUivWOBq0qMf0dJ2iqckDkTn5P+M8Mz/v0cZHsSzhY
         5zhN4JgTAiMgdKrVM1Lwc9tS6CuzIi9EeyYQzOrc91QKwGN+P2mgwXDwuDtvXDDnAeAZ
         ZlpgwvkT80aKz+Ubvdw2x7ZdSyURkhDxrdJSbitn3gdC7u6cmvE1ake0O/ziuEMaSSrc
         lHN/yUnSphwwIesWfAP7UOTMk4IeKh0OAee4lnJXYEx9HmSaMCariWOLbIOGSIMEjIjI
         /8mv2Vu38McwbbsW0h26bpLTeg2SF0qqYJCsh0HzWAw8/C0Zh44g9AbmmRaQuAit20Sm
         dY/w==
X-Forwarded-Encrypted: i=1; AJvYcCX+NrPEufCA0XsQPu+Gggduw0MFKn8KXIbDy9UvLoyvx73zcUBkvFt2iWT5kFrH8AxBqM8/0J/vfzN6Di1hzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlh56RVvJFs5VjnZnhzoptMlWtwz2LUcFWeFbpA60T/vjATJtb
	njrL+DYNDKb43yJnwT9CZt51kGkAAyJAHZxS7LVZyk0Awe3UvLk7cYFQ
X-Gm-Gg: AY/fxX57J78eb27vpA5emqJw0IbPFQJ6nWs+OqXlxTMqdMxMPXGWNs0veIpBB8XTDwm
	gP49g/aBGtuY3jjOVNsesIuaVDRUE7xhVYD0nB8YMo4/O+mqvD70ptxyZL168E+A1eKBfgLks2e
	v1CcwR2IbYOMS/yUPMsUpkYeK7k+yz3y31UIZcbLNHW12SAh8JTUs5ffCCKiWLy2P/uIx/eokxP
	yBXLLvHfD9U+kvJaUHm9AFb1oQlGk40QqNU5XW7RWvoSQcaTcHEpXW6+eBbJrUlDbPpkIg6/ArG
	2zunFn4ZuoyFhEug+TlIe8TiK/gWJfYWOvANdmJbFDFcF5QMT1GQHF61PeRTGH86gqv1v9nGeX/
	owVHfIYhzNwkMI8V7WXYY6OFDbx43hr07Igt7cH4M1CgCgmw1Myd/bH5IIU5nXO8feojIR7QKgJ
	NfbN9YhuKURVuNxaSmAzHHVL6Q3bthOLjlmZDPk7G3VToxdRUZoXPYwGwkzIyODiUa6UM0UBo=
X-Google-Smtp-Source: AGHT+IGbZjuwF7rU12AE5M0CXkptaF4zJFDGmstaaLSpfEpyurKooce1MlrulB2XCsBbxCJGKNaWlw==
X-Received: by 2002:a05:7300:fb86:b0:2a4:3592:cf6c with SMTP id 5a478bee46e88-2b17d208cbfmr16731287eec.16.1768266948465;
        Mon, 12 Jan 2026 17:15:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078ccf4sm17046883eec.16.2026.01.12.17.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 17:15:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <de7f0b8a-a355-42c1-ac3c-d0b5de754711@roeck-us.net>
Date: Mon, 12 Jan 2026 17:15:46 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Glymur watchdog
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260111155234.5829-1-pankaj.patil@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260111155234.5829-1-pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/26 07:52, Pankaj Patil wrote:
> Add devicetree binding for watchdog present on Qualcomm's Glymur SoC
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 54f5311ed016..f5eb648e2801 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -17,6 +17,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - qcom,apss-wdt-glymur
>                 - qcom,kpss-wdt-ipq4019
>                 - qcom,apss-wdt-ipq5018
>                 - qcom,apss-wdt-ipq5332


