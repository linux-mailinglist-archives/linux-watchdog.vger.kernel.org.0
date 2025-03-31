Return-Path: <linux-watchdog+bounces-3181-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B8A7613B
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Mar 2025 10:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B282E167912
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Mar 2025 08:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118281D5AD4;
	Mon, 31 Mar 2025 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iml7BNKx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DCF41AAC
	for <linux-watchdog@vger.kernel.org>; Mon, 31 Mar 2025 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409113; cv=none; b=k8cmf+KxS5aH3Iycj5f1DXD6dEMaGsOTOTttipXzGqA8I2dbMNOcZDhJt3AVDdUXCGhG6LMaFaxmRoqkiom+ZqBq5WV+ukgb+uFBMtabGA3uoN/T5G1emfZDLgdFdHPN2nsgLWENcC8AwX3oVi0bm6yJ2yR1tUBMKctMcbWlxxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409113; c=relaxed/simple;
	bh=7czGx19+Ue/FYjTju2NXhPJvzgtJl1O+BJtmO/KaSwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmFLO9UrHJJNHgJqcZyDyFn2qvP9p4Gi3nAqKRz9aRWbRduy548EbZpI/HdWNIcJYUycIDroShWmla9Eocg46aX7WKw5/46vo2GzU2HP7xY3eYzeJ6XXEaZWNmsBqtknCg8k5qFvil7HTkT5u0kBNNJG4zzTtBN6yVkxx/KqXlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iml7BNKx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3043015f8f.0
        for <linux-watchdog@vger.kernel.org>; Mon, 31 Mar 2025 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409109; x=1744013909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3znnsuY9dskTAhbds49XMwfp61S6Bya9zKCMQ1uerI=;
        b=Iml7BNKxPBjoFpdfonxjuVFiATR4LNX7INqwE+UAAYdEe7EQSPatNOw14HJF3W3g+O
         TJqhj7sFr0GmaLEP3qirv8kv8RCsuzw/gqXQW6H/+Wt5ol+HaS+k/KgcurL6DDZFTpl/
         BepKxvkPTLRpiSC8FcpofaSayIfwQSsfmrEQP1DqpRk4ud4L1nCy4r9uAI19H4DMaDJ7
         RwVQs6UFF34hFSp4QDB5gmIdalZFKG4ZoHpPk8+Wa1ZAzrSC+KvGCAdrIiqdzYaoa15q
         jBcyfeBIfilJriQkrF/kp1Ho/ggIBhWIzLaVsTK3dHjtdzQHDkYX2Wx1CIgiXVo/gevs
         gsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409109; x=1744013909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3znnsuY9dskTAhbds49XMwfp61S6Bya9zKCMQ1uerI=;
        b=TSzxNreB/8CRPbp5DYmWBcTzbdM8aFgcXo1in4APOMBdMn5/OIpNMZizeJNhIBLPtz
         4Q6cCaQni+pgux5+NV/vnKI6itYnCECE8lf2UK32FtUm3GRgakyQZat4+lF4RqBLU8j1
         o3y05PRP0ZeIb2isBGxgUkEm8sAhSsSuFYMtlospL9sDRIK8KFUsecfOCSQe9pKcPwgA
         B10McYrs3ccVl/3RaXnnGQzoAHxa3d0WfIceQ+f2CSskgnGTl3IluDo/+sby/AN+Rk8B
         IssNgCH+fwMVFGoPyFBsYsyFP2fJCrap0ohWxhf7S2dMWJS1w19/vBXUCeSZz+7bYht6
         WGYA==
X-Forwarded-Encrypted: i=1; AJvYcCXl+ry6bvF1rtfxR0La863gO6r+Nx3dTpdBi7eru6gymHdKSZTaFhv2XA1uF/oiHAHHX/Rs+ZGVsULqfpdC2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwamsBSVRQcxvhuY5BeaQKC049wE8DwtNDoPjFctoVb1qZg331q
	2TN+iR/56JvVJaeg3e6mR4M1pnKWIeCf8BobClIEm17brX+ujUyFOs+xo7x/3fA=
X-Gm-Gg: ASbGnct/TNhrqG0FeM7INv7LeNalJgF2jdt9vi9iXCS84wFYFjVcBZ/1oR5bmT9J6bt
	yHjaOyr12n+86RG/K4aWau6c6KG9W8h0jLgj8JZpLo041XXq7d9LZyzbrFexlzKXcGbVt3CcEyS
	fmhrTWuvgti1/+hCrgBpYStWderOWgf86lwNJZjTiS3p69mXuisHuLmRCn1LteWIMd/+KVPUJWa
	YDnuVQVuSEWrCQT44vEIxOT9eC0fX32wLiVhBwZcvE7lmbzZFe4aCI5UDbWHTc02rykLAy3my1g
	nap7C7rRo8ehW3/fjpGpXt+uS7B24JFRUOaFCR4ibZIahxJ69rJgxy5elJOJ1QcQX0Fnc+FckRf
	v1V/6+MSx
X-Google-Smtp-Source: AGHT+IHLcLbL4s9+Xu8fSEA3SNUb2QL3vBVWN0CnlLGjFlAuBAAgrW4sXB1cYcumCEVCYdoZzh11Dw==
X-Received: by 2002:a05:6000:2cf:b0:38d:d166:d44 with SMTP id ffacd0b85a97d-39c0c13b00amr11109382f8f.23.1743409108903;
        Mon, 31 Mar 2025 01:18:28 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc10e1sm113721755e9.12.2025.03.31.01.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:18:28 -0700 (PDT)
Message-ID: <fdcbe997-6ffb-4166-92fe-b31b6e12391f@linaro.org>
Date: Mon, 31 Mar 2025 10:18:27 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Rob Herring <robh@kernel.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, linux@roeck-us.net,
 Thomas Fossati <thomas.fossati@linaro.org>, linux-watchdog@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, wim@linux-watchdog.org, S32@nxp.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <174321222207.2172829.15350189767926637719.robh@kernel.org>
 <20250329171215.GA2298924-robh@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250329171215.GA2298924-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/03/2025 18:12, Rob Herring wrote:
> On Fri, Mar 28, 2025 at 08:37:03PM -0500, Rob Herring (Arm) wrote:
>>
>> On Fri, 28 Mar 2025 16:15:13 +0100, Daniel Lezcano wrote:
>>> Describe the Software Watchdog Timer available on the S32G platforms.
>>>
>>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> ---
>>>   .../bindings/watchdog/nxp,s32g-wdt.yaml       | 46 +++++++++++++++++++
>>>   1 file changed, 46 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.example.dts:18.29-23.11: Warning (unit_address_format): /example-0/watchdog@0x40100000: unit name should not have leading "0x"
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.example.dtb: watchdog@0x40100000: 'timeout-sec' does not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/watchdog/nxp,s32g-wdt.yaml#
> 
> You need unevaluatedProperties instead of additionalProperties.

Thanks!

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

