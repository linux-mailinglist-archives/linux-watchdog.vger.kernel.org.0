Return-Path: <linux-watchdog+bounces-1122-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F490840A
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 08:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3968B216A9
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 06:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D987F1482FC;
	Fri, 14 Jun 2024 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7gBNUjA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A41474B3;
	Fri, 14 Jun 2024 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718348173; cv=none; b=cRa4ptOtfAwGpaPmaGV7jA9qCrJ2AKXV/7NZb7/7fMhroJfQssOGLWsnClrr6ZpxMcc2aVXmy1cBxNp+oMMJoyXGpmKw0/fqsV0/dwTSKwDGx5BXm7v+6rFkC4LTeR/gCXV4IUgm6jEUkPTxk63mzMHr9+aD5MkUONnNN+iypig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718348173; c=relaxed/simple;
	bh=cHzQVR+QoJunZTIXVhTgufjTwPxEpctcpiZI9XSE5Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IknSu5scZDdT+xCMc0WUc+aNmejcPVtOCdmS+0cs86ChCQK9n3Oc9h4O464jjFLMaHVDZWvsp6ualyXBCOT/KQr5HiVpRHDtmZgTQ3FjdPBNPB+lQoT7pwUYovXPKiGMy8xEastXV06OBnNOU4+DfYo1UQNN/FczmEoHmmBJveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7gBNUjA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c89d6b4adso1719218e87.3;
        Thu, 13 Jun 2024 23:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718348170; x=1718952970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n24EXAlVZKGSBdu/7kYSS2jHZx5u9QVUK7yX+sUB4h0=;
        b=R7gBNUjAvL7UqQGGG4U7h0sWBcBbjl9fxyqP13ZBqmtt+Pu2kuuOFHC6y6Pl49wdDE
         IXJ2gBj/SAYDnVJGbANsxRKSEy4KvcfwWxpFuLrtARBBN1p5B3yzoRvP/ljKjwnM/Hc4
         OQQfNLNqSckHV0+zdnHOav5HKIx88CpjzleRejqatE2jvqjSdOEF+n9hy4PR5HimUC0b
         sSWcjN8ArS4NQbFTyqGFkx3uG9G69dQKm951mBeWqLrN5/+W0PGfbadAPo+bj0zbeMny
         0RXwRYiBzsikFhrj+y/Y1a7fHtIMp9uACXjyTWdmMDV6iBCQ4+YoBSsKl9voR41cMvIm
         vbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718348170; x=1718952970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n24EXAlVZKGSBdu/7kYSS2jHZx5u9QVUK7yX+sUB4h0=;
        b=cnn0Cavr4sVE5gLNGjpkUlM0KCp8Bta7ULsGVS3mEBq/JD34Tfv73d/7TbJ10QFkrc
         WqRtGBRjOGiI25Lt97GmXKEeHCS3UaQaX+OQeH/MkzZFZBcUOMeXW22/MaOuYSsHYg7J
         yfUI+FpWbKcAEyUqciI+Shj2C0JTYH9FGW35ukKXSFsYXWdta+5NvZ5F9U7ggkd4+/PG
         Ea3mPj/nGzHCZwpyqAgHaEmCp382yCnGa2AQ68/TdQWNO4Okr2br2EMfQPpUZC/inT/e
         G9lzW9bvX/0KbG9vI2JafI6qs3ZaI0RR/A0cHw/c6t4z+jb3HKD+iFK4MNimVxRwfsgz
         KJig==
X-Forwarded-Encrypted: i=1; AJvYcCX5XZYoYaLunxwNmgQbRApc9WxjWaJGyRmddjAOB1WUq/6Ghe40yXzxfuaTAPRCFfo1EQippqYniZqrj12PnC5wZMwjk6YBQSq0xmfKDDTJaMjelrmus1hET/8Q59K8mfQaorMbWa5/q2HPMH56Wwt0uKE9an5jMvib/79gLMiWeGlgo1ipaH6J
X-Gm-Message-State: AOJu0Yz8F+sMYNq378ipdPHKYC0W50u0zkv8l0cEOVl14qeZNYeyn4FP
	tilyXCvvvfcd0m+gzcctn5CaturNXk3L8Balq02q7mneSGp4maqQVxQZJQ==
X-Google-Smtp-Source: AGHT+IF1aWze5zMVrk59hfZLBXrV94azpWD18wJQFV5oFH7sEx/0NKhdqV8nWXEWDPH+xzHzfni9rw==
X-Received: by 2002:a05:6512:542:b0:516:a091:db5e with SMTP id 2adb3069b0e04-52ca6e90abemr967787e87.48.1718348169562;
        Thu, 13 Jun 2024 23:56:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2887effsm426127e87.257.2024.06.13.23.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 23:56:09 -0700 (PDT)
Message-ID: <21a468c2-7d8f-459a-a5a9-53d8694c3f38@gmail.com>
Date: Fri, 14 Jun 2024 09:56:07 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] mfd: bd96801: Add ERRB IRQ
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <332a2d2429e2ba3c96afd28c1ccc18efc38e1fd3.1717486682.git.mazziesaccount@gmail.com>
 <20240613163249.GN2561462@google.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240613163249.GN2561462@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/13/24 19:32, Lee Jones wrote:
> On Tue, 04 Jun 2024, Matti Vaittinen wrote:
> 
>> The ROHM BD96801 "scalable PMIC" provides two physical IRQs. The ERRB
>> handling can in many cases be omitted because it is used to inform fatal
>> IRQs, which usually kill the power from the SOC.
>>
>> There may however be use-cases where the SOC has a 'back-up' emergency
>> power source which allows some very short time of operation to try to
>> gracefully shut down sensitive hardware. Furthermore, it is possible the
>> processor controlling the PMIC is not powered by the PMIC. In such cases
>> handling the ERRB IRQs may be beneficial.
>>
>> Add support for ERRB IRQs.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> ---
>> Revision history:
>> v2 =>:
>> 	- No changes
>> v1 => v2:
>> 	- New patch
>> ---
>>   drivers/mfd/rohm-bd96801.c | 291 ++++++++++++++++++++++++++++++++-----
>>   1 file changed, 253 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
>> index 1c2a9591be7b..b7f073318873 100644
>> --- a/drivers/mfd/rohm-bd96801.c
>> +++ b/drivers/mfd/rohm-bd96801.c
>> @@ -5,13 +5,9 @@
>>    * ROHM BD96801 PMIC driver
>>    *
>>    * This version of the "BD86801 scalable PMIC"'s driver supports only very
>> - * basic set of the PMIC features. Most notably, there is no support for
>> - * the ERRB interrupt and the configurations which should be done when the
>> - * PMIC is in STBY mode.
>> - *
>> - * Supporting the ERRB interrupt would require dropping the regmap-IRQ
>> - * usage or working around (or accepting a presense of) a naming conflict
>> - * in debugFS IRQs.
> 
> Why bother adding all that blurb in the first place?

Because, I assume there are users who would like to have the ERRB in 
use. The main purpose of this comment is that any such users could
	a) see this version does not support ERRB.
	b) can find the original RFC with ERRB supportn and a workaround.
	c) know why this version does not work with ERRB and thus fix this

It seems this ERRB support may be missing from upstream for a while, 
hence I think having this note is worthy until (if) this ERRB patch 
lands in upstream.

> 
>> + * basic set of the PMIC features.
>> + * Most notably, there is no support for the configurations which should
>> + * be done when the PMIC is in STBY mode.
>>    *
>>    * Being able to reliably do the configurations like changing the
>>    * regulator safety limits (like limits for the over/under -voltages, over
>> @@ -23,16 +19,14 @@
>>    * be the need to configure these safety limits. Hence it's not simple to
>>    * come up with a generic solution.
>>    *
>> - * Users who require the ERRB handling and STBY state configurations can
>> - * have a look at the original RFC:
>> + * Users who require the STBY state configurations can  have a look at the
>> + * original RFC:
>>    * https://lore.kernel.org/all/cover.1712920132.git.mazziesaccount@gmail.com/
>> - * which implements a workaround to debugFS naming conflict and some of
>> - * the safety limit configurations - but leaves the state change handling
>> - * and synchronization to be implemented.
>> + * which implements some of the safety limit configurations - but leaves the
>> + * state change handling and synchronization to be implemented.
>>    *
>>    * It would be great to hear (and receive a patch!) if you implement the
>> - * STBY configuration support or a proper fix to the debugFS naming
>> - * conflict in your downstream driver ;)
>> + * STBY configuration support or a proper fix in your downstream driver ;)
>>    */

...

>>   static int bd96801_i2c_probe(struct i2c_client *i2c)
>>   {
>> -	struct regmap_irq_chip_data *intb_irq_data;
>> +	int i, ret, intb_irq, errb_irq, num_regu_irqs, num_intb, num_errb = 0;
>> +	int wdg_irq_no;
>> +	struct regmap_irq_chip_data *intb_irq_data, *errb_irq_data;
>> +	struct irq_domain *intb_domain, *errb_domain;
>> +	struct resource wdg_irq;
>>   	const struct fwnode_handle *fwnode;
>> -	struct irq_domain *intb_domain;
>> +	struct resource *regulator_res;
>>   	struct regmap *regmap;
>> -	int ret, intb_irq;
>>   
>>   	fwnode = dev_fwnode(&i2c->dev);
>>   	if (!fwnode)
>> @@ -212,10 +364,28 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
>>   	if (intb_irq < 0)
>>   		return dev_err_probe(&i2c->dev, intb_irq, "INTB IRQ not configured\n");
>>   
>> +	num_intb =  ARRAY_SIZE(regulator_intb_irqs);
>> +
>> +	/* ERRB may be omitted if processor is powered by the PMIC */
>> +	errb_irq = fwnode_irq_get_byname(fwnode, "errb");
>> +	if (errb_irq < 0)
>> +		errb_irq = 0;
>> +
>> +	if (errb_irq)
>> +		num_errb = ARRAY_SIZE(regulator_errb_irqs);
>> +
>> +	num_regu_irqs = num_intb + num_errb;
>> +
>> +	regulator_res = kcalloc(num_regu_irqs, sizeof(*regulator_res), GFP_KERNEL);
> 
> Why not devm_* and omit the kfree()?

I used kcalloc() because this memory is only temporarily needed. It is 
not needed after devm_mfd_add_devices() returns.

Sure the devm_* would simplify the error paths... Thanks!

> 
>> +	if (!regulator_res)
>> +		return -ENOMEM;
>> +
>>   	regmap = devm_regmap_init_i2c(i2c, &bd96801_regmap_config);
>> -	if (IS_ERR(regmap))
>> -		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
>> +	if (IS_ERR(regmap)) {
>> +		ret = dev_err_probe(&i2c->dev, PTR_ERR(regmap),
>>   				    "Regmap initialization failed\n");
>> +		goto free_out;
>> +	}
>>   
>>   	ret = regmap_write(regmap, BD96801_LOCK_REG, BD96801_UNLOCK);
>>   	if (ret)
>> @@ -224,18 +394,63 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
>>   	ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, intb_irq,
>>   				       IRQF_ONESHOT, 0, &bd96801_irq_chip_intb,
>>   				       &intb_irq_data);
>> -	if (ret)
>> -		return dev_err_probe(&i2c->dev, ret, "Failed to add INTB IRQ chip\n");
>> +	if (ret) {
>> +		dev_err_probe(&i2c->dev, ret, "Failed to add INTB irq_chip\n");
>> +		goto free_out;
>> +	}
>>   
>>   	intb_domain = regmap_irq_get_domain(intb_irq_data);
>>   
>> -	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
>> -				   bd96801_mfd_cells,
>> -				   ARRAY_SIZE(bd96801_mfd_cells), NULL, 0,
>> -				   intb_domain);
>> -
>> +	/*
>> +	 * MFD core code is built to handle only one IRQ domain. BD96801
>> +	 * has two domains so we do IRQ mapping here and provide the
>> +	 * already mapped IRQ numbers to sub-devices.
>> +	 */
>> +	for (i = 0; i < num_intb; i++) {
>> +		struct resource *res = &regulator_res[i];
>> +
>> +		*res = regulator_intb_irqs[i];
>> +		res->start = res->end = irq_create_mapping(intb_domain,
>> +							    res->start);
>> +	}
>> +
>> +	wdg_irq_no = irq_create_mapping(intb_domain, BD96801_WDT_ERR_STAT);
>> +	wdg_irq = DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
>> +	bd96801_mfd_cells[WDG_CELL].resources = &wdg_irq;
>> +	bd96801_mfd_cells[WDG_CELL].num_resources = 1;
>> +
>> +	if (num_errb) {
> 
> 	if (!num_errb)
> 		goto skip_errb;

Ok, can do.

> 
>> +		ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, errb_irq,
>> +					       IRQF_ONESHOT, 0,
>> +					       &bd96801_irq_chip_errb,
>> +					       &errb_irq_data);
>> +		if (ret) {
>> +			dev_err_probe(&i2c->dev, ret,
>> +				      "Failed to add ERRB (%d) irq_chip\n",
>> +				      errb_irq);
>> +			goto free_out;
>> +		}
>> +		errb_domain = regmap_irq_get_domain(errb_irq_data);
>> +
>> +		for (i = 0; i < num_errb; i++) {
>> +			struct resource *res = &regulator_res[num_intb + i];
>> +
>> +			*res = regulator_errb_irqs[i];
>> +			res->start = res->end = irq_create_mapping(errb_domain,
>> +								   res->start);
>> +		}
>> +	}
> 
> skip_errb:

...

Thanks for comments Lee. Reworking this will have to wait for the 
irqdomain name suffix, which I will continue after Hervé has done his 
part of the irqdomain changes. I will omit this patch from the next 
re-spin of the series.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


