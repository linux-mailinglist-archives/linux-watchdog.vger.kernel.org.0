Return-Path: <linux-watchdog+bounces-1107-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81A8FFC51
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 08:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10EEC1C26A9D
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 06:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BC714F9DB;
	Fri,  7 Jun 2024 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aafw3Sxk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED615357A;
	Fri,  7 Jun 2024 06:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717742318; cv=none; b=UtcKjdQucXNoA1srZyO+O2sakyD8I34q3JNqSFV5vUKDHOzv7SaLMnbcdvJfKEiaRBvz4E6SUG43ufIXhqsi8OYF2yevXzio0yT+/UU0hgbKMfRDkHmI3STzgf3aHfvnB9LiLgcYmBaaeLsnLEaW+iRIrYTooOC56ybu5YZtNl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717742318; c=relaxed/simple;
	bh=ERJWnWVnpoGLs0blFqeBB0v+fa49FBV9uXKidkjKQ0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igGBpuEM50UBebKyOx/R4J/s139d1R1yTiDvVsx7/KemzcW55GIwB6eX+OZ+5LmhPdsf/K9GFSCnUCQcu1rp4XEy0ZW8Xh6InlgxBL8//wN8bOImTerKqgUZgsSBwcMXvNU+Xf6T5UqVGszLYPVYm6Max4/k7Rzt0KobYbtd8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aafw3Sxk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b82d57963so2137633e87.2;
        Thu, 06 Jun 2024 23:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717742315; x=1718347115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FZkbWYXotXP0D+I4t3xbShikjVMWcCFV6J3lsjGVH3s=;
        b=Aafw3SxkcgRFHi/b+KCy1TvWikvBQwg2bT+IlGnUTbk0Gar7oOX1VrjMq/qPcvt/qA
         eyL8N7IikxTGJ5+vEwTg55EAI6uBBPmsrhyrIUYibWKJsUBb5u2CSkc9KDY5G+AwHlR7
         t9F+z9B9mp0K8KLabG1YvMeT0hDbY/dxGaHuiv/QZzw9E4B8InMJrb6RjgxmdgAap85w
         qbr8abEc3FtG4ryEAhB9yaQenRKA/Yj87oZY92a2Nnqhd8A7KEVLg6QCO5PyxkGIJKv1
         7wGGbQAS00XHpXwiP6KFgaOjshMcBwYZIZ62Zxxq9tRTchUL8snwNk5dTfoSZeQ0HhID
         4C+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717742315; x=1718347115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZkbWYXotXP0D+I4t3xbShikjVMWcCFV6J3lsjGVH3s=;
        b=LGnQj6H1mxBH0NJgPQYMZffbeCXnnFB5kLj8TxNMf9g5nwRDmtbR6sInZJf7bsV9gt
         Pxrk0qkQGF6L1dRHqL8V8CWWLJERXcP2TIEBlOSAYIXF3Q0FZnEZ7qLGftNbIL4riesy
         l9EgtFo5i4lDkMn4LOFfovFigEiaw9v6Zby8GhCKc2/jclc/H+8wscaJu8Jn1le1jnLv
         8zB8DSFxkkm9nrScz0bHXAWXdo+deIxQpRQmXWuCznLx0vxjxvaW8I/pFCoK8PjQ1a6a
         8fdh0EpwW9L1xMlKuNiyrueIxXKGxCxSvNJcUPEVW2gL2WxJD3tefFEwrkhAr2yvdo1k
         3S3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+f56NSfC/CmokxexBAJvrb9cE/EnU0cmXgNSzlFwvN7g7ns2vZMgFEVkLGW2Rxoui6a6SYa8INArzPJDx00z22Y7X4wOgCxdI2ddrhrk/FOP+RNVDmMdSlnNqdbqIEYuyGUoCnH4XDxERnEHSTiurF5+YARBKb/zIoSD+DarsA8k0dYUq79F
X-Gm-Message-State: AOJu0YySyNkvTcHk/86OwYMuXX2gd0N1Gu347kEQEgyOhPaj/fZPi8hy
	pZDmj8BuUFOodk7lV+KzbUHusfUjCxq4elHPs4ualZnNj3E18qEG
X-Google-Smtp-Source: AGHT+IEJPE2IkHyGgR9Xlx+xEEalQpxNqOZE+n3WGHVUhojllNSi1XReGieC0Pd/3yUiKOUCrBw0uA==
X-Received: by 2002:a05:6512:3d0d:b0:528:649b:d7bb with SMTP id 2adb3069b0e04-52bb9f14411mr1284770e87.0.1717742314527;
        Thu, 06 Jun 2024 23:38:34 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb434dd31sm425529e87.306.2024.06.06.23.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:38:33 -0700 (PDT)
Message-ID: <045828bd-4aeb-4d8d-b152-44a816a07221@gmail.com>
Date: Fri, 7 Jun 2024 09:38:31 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] irqdomain: Allow giving name suffix for domain
To: Thomas Gleixner <tglx@linutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <bbd219c95f4fe88752aee5f21232480fe9b949fb.1717486682.git.mazziesaccount@gmail.com>
 <87plst28yk.ffs@tglx>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <87plst28yk.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Thomas, Herve.

On 6/6/24 21:59, Thomas Gleixner wrote:
> Matti!
> 
> On Tue, Jun 04 2024 at 10:55, Matti Vaittinen wrote:
>>   struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, unsigned int size,
>>   				    irq_hw_number_t hwirq_max, int direct_max,
>>   				    const struct irq_domain_ops *ops,
>> -				    void *host_data);
>> +				    void *host_data, const char *name_suffix);
>>   struct irq_domain *irq_domain_create_simple(struct fwnode_handle *fwnode,
>>   					    unsigned int size,
>>   					    unsigned int first_irq,
>> @@ -350,7 +350,8 @@ static inline struct irq_domain *irq_domain_add_linear(struct device_node *of_no
>>   					 const struct irq_domain_ops *ops,
>>   					 void *host_data)
>>   {
>> -	return __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops, host_data);
>> +	return __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops,
>> +				host_data, NULL);
> 
> ....
> 
> Looking at the resulting amount of churn to add that argument, I'm not
> really enthused. There is some other unrelated change required in this
> area:
> 
>    https://lore.kernel.org/all/8734pr5yq1.ffs@tglx
> 
> My suggestion to convert all of this mess into a template based
> mechanism would nicely solve your problem too.

I am not entirely sure what you mean by template based in this context. 
My brains are somehow fixed to start thinking of C++ templates, or C 
macro magic with typeof() and I just can't get past that.

Anyways, what I picked from discussion between you and Herve, is using 
an initialization structure (struct irq_domain_info) for the new domain 
creation function (irq_domain_instantiate()) instead of adding bunch of 
functions with quite a few separate arguments. So, I assume you're 
referring to a possibility to add the name-suffix in this initialization 
structure? I hope I got this right.

I assume there is no intention to change the existing public 
irq_domain_creat_foo() APIs to use the new irq_domain_info - and change 
all the callers(?) But I think changing the internal 
__irq_domain_create() to use this new info struct should be very much 
doable - although, in my opinion, making existing callers of the 
__irq_domain_create() to assign their parameters to this struct so they 
can pass it to __irq_domain_create() does not seem so nice.

So, even though I am not really happy about the delay (I secretly hoped 
to get the series merged before my summer vacations ;) ) - I admit your 
suggested change looks cleaner (again, at least to me).

Herve, do you have any idea when you plan to do further sketching on 
this? Do you want me to try seeing if I can add the struct 
irq_domain_info and maybe use that in the __irq_domain_add() to get the 
name-suffix added? I might be able to send one version out during next 
week - but then I plan to be offline for couple of weeks ... so it may 
be I am not much of a help here.

> Can you please have a look and eventually team up with Herve (CC'ed) to
> sort this out? I'm happy to help and give guidance.

I appreciate the guidance! Thanks Thomas.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


