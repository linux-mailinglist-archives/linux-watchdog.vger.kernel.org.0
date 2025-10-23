Return-Path: <linux-watchdog+bounces-4412-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B235BFF436
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Oct 2025 07:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ADE6D353E9D
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Oct 2025 05:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04301531C1;
	Thu, 23 Oct 2025 05:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St0G8EnO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AC26ED50
	for <linux-watchdog@vger.kernel.org>; Thu, 23 Oct 2025 05:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761198107; cv=none; b=VlfDKK/Nz5IL3oeBWAYPMOElecSsi//yjnB5CuQcyGMPyuH+SJMT2W8fIPnOuL85Hg1JzmhdG8SaMGjA/8uvXJyYTqBeOuLGNernvcDEUO3knJzQNJZ6ckPFHqAy0/SsF+YQKhlchZHP2ke4cniI3RbnFAZA6dI2m34i7EWF+08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761198107; c=relaxed/simple;
	bh=fwXNHVV2OsfDgklhZiAQIp1sKiKkUwVMzcFG2SCy8y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ettb45ZA/ldBSe4Hx9fYXPImA1/l5Nu1Y9P8GPK0hk0e8v4bow2pPP62+9iZEqDEsu4WECXNr4AOQF3likIxAAMOJXD5tWP0CeeVdQmwXVeLQFpQ+sfb8pbSA+7usP8/6FR2daUxa2tDzuf5SmC4j1CTxsviRPJsfujzItKiH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=St0G8EnO; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59052926cf9so464693e87.1
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Oct 2025 22:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761198104; x=1761802904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVmnu0DcZ8PNVbYItIhiUlRCiDcnVxMhr+Gj1/Vdtvg=;
        b=St0G8EnO/7ctw7wWYLzFsPxXP3X47Mvrz4Bt6ld4C1OZxhq0oW8RJSXr0o4p3sh4AZ
         cBCyB1hFmqnPCAUT7McibacyiQ7uq6kOPzX61uNLiyWR1uEsC5AAEzQ/BWAkEPwoF1NP
         QQlT4AVxdljnwS6M9uo1/kaT8AN7rVWFKdhI6ueelYQzDJoALUUXHE6ux70AVfKT2jYu
         adOScAIdGDFuhPfiO9JVprOkOqyLJRAl3F/viyoVMW7pYHBDQVf6us5WVVGrPqUxkaRT
         5EV/QB0768DM+DriYoFQ6x3tnILCjGPw1cnOheJdk2OCmqT3pnYt1kF64GP71Vx6J1gn
         oW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761198104; x=1761802904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVmnu0DcZ8PNVbYItIhiUlRCiDcnVxMhr+Gj1/Vdtvg=;
        b=rMQix7NgGUmft2ehAjjTeg5I5gQTXf0egLq5sHmaub7yVTP03ZiNsISd1kybWgq8lX
         cibP88ch3XuH14XatWvNtllDtfdCFhuCbf7F8jIqpUiPqNS7haoBL6Cjc+i35o+CReCD
         9cWnQNRna/wC9MJW4dZIvmjlOtpJdK6BHI95zYO6P3bcGO2d1IwWvXc+o2tejC0bvci3
         dlzWoND/qtgP6xCvhGmgPNLkB189gDnWdlfrdq3JkQJxVOk3MY/psc5CWlBwnny8Ba5P
         BhcJ3kvASNnEWUTvOoBIaZwZ+Jn+PMw4d8XWvbEoh6zmL29/YKL1JjuD/c9sSGbqmk9G
         JlUA==
X-Gm-Message-State: AOJu0YysWZa+QLfLsrVYdgoRowvcrzd5SGUnzxSLYLbD1hOeVQgp0Kik
	pRqRHzRIAtJACJ34DfsUEORqrckvzFrfKO9ZfETzn4nRYnAc/e3V2w3D
X-Gm-Gg: ASbGncvZF9u4HEjPT40tKINIl2oImkrSF+tjYK57KSEYLoPjFY2vyBi2wj1MsBMvedx
	6dBD4dJsResjYezEhrTCCpTxo+aLEpp7Jkcl05NmyHqmrcQAFijgLXqkerxRDV+o8ih7EWNNhVy
	UFUZastoboFgvNivzHrCnui8BLXHoVKdMguuIgESyOSc1+JGegrvZzkFoSK/bzdbF7TT2QYbGJW
	FrVbzDn5n4bM7mt7hZLk9JiMaIl5cci9vTqy5SBkcftyKsfSChuiqfbatai387QZG4McrOyfFYe
	AVIzGfxm0XV76VT1LVg1XlHx/u2iaLsKLvUAf6gdasjeB9kDeY2GJEzrSiR7PreUwG/DZutwgc5
	q60X8ufU+vFuKYoJdv7y0jbs47wZV++TsU425iLUrZ7DXYryUoOhJYuFOnF+uqKiobLatRGuwgC
	BiXXa0BbHJi91ryb5a1I8NhaMXk6P4uWHgQnT8YRv+JO+FYvHsLu2WUj8hd+6PiWfIhtOs
X-Google-Smtp-Source: AGHT+IFvTCGfh+EzRAJlvDZiUcGcWmXgVO1C2EBm2Vftv1WhIVV0oVHchDQFJ2UcgQEiCnOaTQzqpA==
X-Received: by 2002:a05:6512:3d21:b0:592:f4e8:720c with SMTP id 2adb3069b0e04-592f5a712d8mr391894e87.56.1761198103848;
        Wed, 22 Oct 2025 22:41:43 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4adf080sm454893e87.18.2025.10.22.22.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 22:41:43 -0700 (PDT)
Message-ID: <e215a74f-4c66-4e8e-bb10-b90d782de2bf@gmail.com>
Date: Thu, 23 Oct 2025 08:41:42 +0300
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
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
 <20251020-dt-bindings-watchdog-timeout-v1-3-d0f3235eb327@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-3-d0f3235eb327@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Krzysztof!

On 20/10/2025 19:52, Krzysztof Kozlowski wrote:
> The parent node of ROHM BD96801 PMIC is also holding properties for the
> watchdog, thus it should reference watchdog.yaml schema.  OTOH, the
> timeout-sec property is used only as one number.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>



