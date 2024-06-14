Return-Path: <linux-watchdog+bounces-1138-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D130908CA3
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 15:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F7D81F21B3E
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 13:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064E51854;
	Fri, 14 Jun 2024 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPrJ390q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E23863B;
	Fri, 14 Jun 2024 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718372656; cv=none; b=jpI5wSykI6d0NYdpmpqlWd5Sj80INwYry0ZOnGuEk40np2gl523IC94YnNhU6iXbVVb8rGSjCwp9lxpDUonkqerFb/wvU3cTpKbmgq7txnyXluuasRId5RWB5S1cPEwDRv/gSE7LdaXMRYyyhYIddedhEsySsSsXWbSDacp0C6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718372656; c=relaxed/simple;
	bh=9d9IzUoE2+eVdkcIPQMk157cYBuCzlq8DwrQXaQ1tfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUghxwtD2k144vY935+nbJaGI8wt1tA4/Hzd2vCA/KR0Vh9+8pGzXGmuK6a+fOue4xQNUaU5LKoe4hKln5BxCYB6ZccZXof4aiXJaW1F5+mVU9PRhiQZX2oV28XM75nS0aYMYq2lQRSBzOZZcJz7hFHnJESf6pQWyJ25sjf/TNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPrJ390q; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6e4dbca52f0so1621780a12.0;
        Fri, 14 Jun 2024 06:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718372655; x=1718977455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9pWt36fA1ImegtbiozNKZ8YlNa/rmVvAUUCSYTJtjCU=;
        b=VPrJ390qpGZBZtsuCEf3Ch06l8AT/8SeI165EQfEpWoGJGUBGJc0daefo8hYuJI00d
         eT6k8ByFJCGV7i5B46wEPrahhNkfOV6ZCPVSys7Xvp+4+TCN7eYNP/a0FG4F2ZNXQk7n
         y63AthdPCZFFEtMfEjJNn/3WlD5FIKoin3fn1Dfv/mdMPDZFjbWChByBhL+2lkUkRBOC
         BsgGyrkw2WEnXLg9JncXypL/Fx4V/jaot5kUsOKl3QVu+y04qCnOZeOddlD4ANj/ALI7
         BT/0sgX+cobBpHMVhl8eUSf2IPtHeWt2Sy5v0ZkU7rlmInEC3AO2HX7c2wfvqNW75hJk
         hOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718372655; x=1718977455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pWt36fA1ImegtbiozNKZ8YlNa/rmVvAUUCSYTJtjCU=;
        b=RwrXBwWX4ibVpICX3l0ky0D6HSpo9x7i5yViItuJbzFJgXRrVYWzfxIcBAvncFvhDN
         KMM26R2wmMXWQRLNaAMKRs/RpkdvSLs/c/b1zIAWiwHKWAghpavs2oPlBx4gNMAXArUY
         eiXOE+sHuy828XaOpN2QYVArdKtrw4pF71o7yYSgtd+DpDsMCLf8/VueIsfL8CRFim1w
         YqnOSW0bWOlHDdVBFbylW4gKkJZjMGZGY89ilRqDoFFLTkmVPzOK1B1Pij26ffSJeLhv
         TrjHYeC/nhbfcRmJnnkcn2wKDQmT7VgXMqfrjNmvI38MbIvb5iOwCanykPHGzQZlI8ak
         4Z9A==
X-Forwarded-Encrypted: i=1; AJvYcCUjvWbVlhtol0Hv1HDwKvZc2NuXBVy7rseciMMDR619J1pRKHZihcJerCZIf53HLrsMpv3l/LFr80V73p4RLu6IWP7UPKZrn850Kzd9HD1z1J23R2Udv/dGJp0BgWW8TDC7kRWNZai0CQNgxkpBr521TQ1QnwJ2Hp+uNjsdeq+gscv87NJq3RVl
X-Gm-Message-State: AOJu0YzLDtSWrh8Zr6zKnzl3SAjUIob1vUjSaGXxSxYUCqN2idC74kCo
	NscRCGu2r0rHpJXLxTGi5mA9GAVRauEVDPKIw9tXfpQxZ1j1W/n2
X-Google-Smtp-Source: AGHT+IEvP8t2ffSBqYdq92RijhZuEGPaJGqm5YRscjgDlFxxcMkRANPd74CIRHeWieKUTyR2tW/D1w==
X-Received: by 2002:a05:6a20:2449:b0:1b7:571d:3d03 with SMTP id adf61e73a8af0-1bae8280862mr3143824637.44.1718372654495;
        Fri, 14 Jun 2024 06:44:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4e4a3ba94sm1422591a91.17.2024.06.14.06.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 06:44:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <36f19569-fa5e-4ec4-a910-5bfbf6ea11da@roeck-us.net>
Date: Fri, 14 Jun 2024 06:44:12 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] watchdog: ROHM BD96801 PMIC WDG driver
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1718356964.git.mazziesaccount@gmail.com>
 <00911b1d1676b828c509e7c39237f9e602b43570.1718356964.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <00911b1d1676b828c509e7c39237f9e602b43570.1718356964.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/24 02:44, Matti Vaittinen wrote:
> Introduce driver for WDG block on ROHM BD96801 scalable PMIC.
> 
> This driver only supports watchdog with I2C feeding and delayed
> response detection. Whether the watchdog toggles PRSTB pin or
> just causes an interrupt can be configured via device-tree.
> 
> The BD96801 PMIC HW supports also window watchdog (too early
> feeding detection) and Q&A mode. These are not supported by
> this driver.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


