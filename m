Return-Path: <linux-watchdog+bounces-4408-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B9BF2EE0
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 20:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8791F4EBB84
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 18:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DAE332EBC;
	Mon, 20 Oct 2025 18:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK7EioqS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F163321B2
	for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984895; cv=none; b=jcsgRpzvoIweKEdrI65VtOokINu9E0aqXodQ68ZCjgjNRUxUJ5EIPqoPHu9Fix1PBtx41wtxawlrbD0lyTyDf1m4ukueNHp6alr5Kfxim6r68bk8mu8Fe4lj/1XlG3A+nIMN7Mf8QcTzphth0Cpp+kPa4pBibh91kUluqlxDqaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984895; c=relaxed/simple;
	bh=SsEF18SdcbxARL97VlTND2ETEKSS7WjiPQkcE6caLPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDJLIe++LthRvcnlrNjV7663Ppz+DRq+RsKuQaMSTAn0vqbwtq6cQIq8swGw8HTJSf/yOckdkgFRCRMp9i0oj3dmHGqMIITYAB0T8TZhVUl+7r5Np+CAop2gyKHPTzcus8iEaqnXoJK4e987E+6MsN+31MvUgAmXE/667xtrmMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK7EioqS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a226a0798cso2705718b3a.2
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760984892; x=1761589692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=O11l6c/6WNY6EuzWxhhuUfeETXk68wKUAKWksFL62x4=;
        b=NK7EioqSHL5MVHe/GnBv+lruc4ZfcyBty0Njrn0FSvK7dZXT4ai79NeIyY/73JjiD7
         cIo8HrO5DAyolUtsQSqDxWm3BmaZ6LkZt3cZ6szFXgFRihs0+DHu2vVF55U6Rpvx9AVP
         2b0MKYao1T5FF0hkX0Nek7QLdibF3XrVUVxKFuiHXzU/Kh7oULulBaGceNMZn7bdmT6z
         Q7RBXcJo2yriBWjQxlylG63ltM6okNq4NHgztG0R5HhDZ14JbqMD2u1lQcI9ZkDBEXXF
         UMh9N4F+XcN0HdPqB4DRRC78sorQRYqsa0DpPWjuhLsAOqgL5TdTGUxidOTHl9yihvKi
         bZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760984892; x=1761589692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O11l6c/6WNY6EuzWxhhuUfeETXk68wKUAKWksFL62x4=;
        b=eCbslqF4H2SxM6fjzDs+jzaDQUvS/9mciqRDWeP+6dsNEJF0KX4yLDS4cHgz56QkF5
         9r21T8bZr9LYCuD5OldSLg2nDnt8whmzjEKkdhI0l9g+fibM2sO4oyqRPMvgCL6lFJnV
         0dqIje2WBbKMcCaI3WS4miRQRGp20yGA2/Cyra9uIYXyVGbTN4A54ebZKQG7tPbUibfo
         8vIJEBrDFOakAE8lISxdOBpFYx723HsQS5qHUw7Rn90x1/LJgINa2xLEZ2O5qZsMuISC
         iJf0Ez8z3Yn64VahYL0spba46Yc7EEITx/JfjZDQPUygl6CP9JawhQ7Pj2UdLospXR6Z
         HZDA==
X-Gm-Message-State: AOJu0Yz8ChaHNUI9Sx14biscf66QRnEPOfN4qKiYrmAGXu6Y65e1bl4A
	uEZDTlwZaeN4ZiIASrUed7Ye993kuK+NM2UbDv8mrvNqyGS3l+PKyJSz
X-Gm-Gg: ASbGncsKy81eYoEre+1whWD94qxl2D92n1C1BpmXcKhJAcYPhFvYqLJZ7TCa41FI9Hq
	rBH4FiqNocOczKP4IQ6Fj9Xk3joIoKkNCq7HHJJ/ddwEhKczJMp+ziBPIzgsUdFe3/wFCqgzOpK
	itKUmnX+0SmHs3s75+WEeZuB+VFPKVjWRymBGHjXT61zk6kYrSslmGsPWBpFX9cxcuwMHNngejd
	D2K/hiYyAWQC4C7r/fanA3eX2KvZT1wfYFY2XcyXSsvvdFy2BRRkzDZZro/EeQv8y4aJcJpeaD5
	uHF4rfslPxRp+uXff3zVuZnTVVAJTWEz+My61AuYP8ZvzhVs8ZSrEGcKWWG7ABGDXKfMbU7FAW3
	xeTs1fKf/J0lJ1tO3XAjOFSJkHHSePobvW20ghkEx3MJN3fWlAfDRJxuQDVIHWIxY4sJHkRggfC
	/kQqD3ISRst4RAIRm33UjuaueVxZ4utQuBJu0clA/OZPtr+48l
X-Google-Smtp-Source: AGHT+IGxOtMDTcCkSSe1r7ijbi+tu9WmGE3vb/BccPHTGQ1lE+8Q4yHdexM+nwMk8emt8GMaB+ehRA==
X-Received: by 2002:a05:6a20:7351:b0:334:a022:d7ab with SMTP id adf61e73a8af0-334a8629434mr18752755637.43.1760984892032;
        Mon, 20 Oct 2025 11:28:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76676a2esm8200311a12.15.2025.10.20.11.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:28:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <49228a45-7e53-40e3-a5bb-49a4dd1823e8@roeck-us.net>
Date: Mon, 20 Oct 2025 11:28:10 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: Allow node names named 'pmic'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
 <20251020-dt-bindings-watchdog-timeout-v1-2-d0f3235eb327@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-2-d0f3235eb327@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 09:52, Krzysztof Kozlowski wrote:
> Watchdog is often part of more complex devices like Power Management ICs
> (PMIC), e.g. on rohm,bd96801, and the schema can be referenced by a
> binding describing parent (main) node.  Allow another typical name for
> such PMIC devices: pmic.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/watchdog.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> index be0327f587eb..77ac23516d6d 100644
> --- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> @@ -21,7 +21,7 @@ select:
>   
>   properties:
>     $nodename:
> -    pattern: "^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$"
> +    pattern: "^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$"
>   
>     timeout-sec:
>       maxItems: 1
> 


