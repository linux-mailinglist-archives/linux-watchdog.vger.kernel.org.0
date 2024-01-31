Return-Path: <linux-watchdog+bounces-548-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59652843CE2
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jan 2024 11:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DDBE1C25E4B
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jan 2024 10:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BF769D0B;
	Wed, 31 Jan 2024 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FL6d+Ifc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6A524BA
	for <linux-watchdog@vger.kernel.org>; Wed, 31 Jan 2024 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706697356; cv=none; b=FXPEDW53mchHaYNALf2vVq1fa0fDq3kTIWvXEV0fNIAk2Ej+98Vgfq9xffRQvSR+nkpyzq0/OJfH5g1ydxAYxceIicmAeRmvTbgnCVd1kg6qF/KaMNqYOQ9zLw/jd0atK6Pt/MS0O4t+6d/kOjUe1kSbs7Fx2VIUtKJnc6FpneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706697356; c=relaxed/simple;
	bh=nWZdsSgwTjyyKA8uIzHiLFSttDj9w6HgSAepKu4fDJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOsBpITe7qHwJp3xDGAMkeCFY53YYXMTPuXxTR+ERdRC0X4cji1Eun14TJpsiffwpXRUoccUjb+FORoXMUMWOhcaJoSv000EE0N2rAoZXN0ZMXKb83I0RxWq80quT70JxvZB7IQavzo5xSoybd55xoHmf+HJNaHkNw7jNsc8weg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FL6d+Ifc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a90a0a1a1so5231251a12.0
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Jan 2024 02:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706697353; x=1707302153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgGOPxj1DfUiTzRWe/Uz5+ogQ2IffkUiOQwioCVm5zw=;
        b=FL6d+IfcxvJWT553QoZTiFfhBFTj5B0ErdM6J2lxvBpmyOHLW8KjEF2xjrQLLA4j5e
         rf1HUjGBCnl2ndckHvxSxz3G9MiiWryfwk09ElLMoJ0EWkxRvz40wwpSub0S+pXnopTO
         hlfxhTgBdY8D8goWjrL+fXtj78Y30GTWkCw09I1pWI2ahW9pQR/C5B8GOhhs8TmNtWAf
         zO3iG5lm9j6v+Ge8Y8PJ5wg7O5WN7QkeboUlwZocHma6gq9IecnETLSgkJ5Ph9oWWaJo
         mrvzcl/IaGFQhwJhFvw+KzLzpEcc4mOTRcTYQxBjKOXLRxclvfFDN8vK+2ndZ3RZ6b/Y
         kMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706697353; x=1707302153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgGOPxj1DfUiTzRWe/Uz5+ogQ2IffkUiOQwioCVm5zw=;
        b=V3yNXAqHXo5s8444fhzC7blAsz2OXB9Ee6jtJ7a4CIILFfgx3qj5qmdEAfOElvr28H
         sBsi+l9MJke93KlpeAZncqZ/Tml/1reTf3HSOeDWxraUk4Nc/9qBVRlHvAPfDA5Dy4il
         WfL7LTcx/vEcIrQA/nrA+bOP86bzDTabP4rIKxozY6hCryK69b4+IwbKZ+PEgBXIdEPr
         zUdzsR5TIvMl2AZvyLd8yrfTg+PdVc+jAS6astD33ogzuqqKsfbfxPwvIz5hBjXrbxSC
         Op+1mhz1QFBienai2V5V1wjGAuiqLgR3J2kLfVVOXS68XToOi2azDGvZ+IDuiGxZDPMv
         eo/A==
X-Gm-Message-State: AOJu0Yzgecv8Qyk6blKYTZ3mAIEmLPT90rbdgxCIQaGJMDD68Pnx4lC4
	JWqA4/etBRtasWyeFNOlXfHu99xaw4KUR1piVmxTfT5XcFRRcAM4RoTarzjflQw=
X-Google-Smtp-Source: AGHT+IGVi+8wnBK+0KD8MyW3qSbUwExH/Jm7HmdrLrkPc5iM61BoSr8EWjfGP/79xd0gJBFk9GbFDA==
X-Received: by 2002:a05:6402:509:b0:55f:43af:19d7 with SMTP id m9-20020a056402050900b0055f43af19d7mr969840edv.34.1706697353076;
        Wed, 31 Jan 2024 02:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUSLfd2+TFDa5V41H6GH/UeEwJaBUeSGhNOSJAu81wSnO3+Lxg1+AGV8uy7gr4mlHbHuZSzpCaIH69Oeg9UDyf79wjFx0Wrdc6PLW08BG72CxCQtAU+uE5GY3IuhWeDqLxRhJV6ILeqJQ6lYv8CDKrbxtVGZxdzKon7/Tc/oXSpnIjVsKBxDm5ePvYATKlH/CS7ZGJjqWX8pzrJOjIfTXuQzQTImOrg0M/1tLIAR5pdah6wfYcU8fpZkiHEVChLeMs5P/71lvoBNPMiwfhCx3xZcy7ao4ahhfpxCUEwNgu+mAbGzr9/Fs5fBQs8duZCHffztBC6oVQjyw9xi2EKp8R8Ev8t3lcTeMYLAqJIEy1QUOFdf0MdmxN4a5ngjyC0kSlQSFwWOrKAI9fHQBRiroTznsbk3wcNJn8CTwOmiPOGDTx0tkyySkz9tL5Ute5/4rpop8GS+gFHsPssdy9Ar0xrmfXbCoLBwVo652B7sy6oF4dxMdbSsWNgZ6Wn7201FusJP1ScK6lPHgpguazoXWKLgbeEbi+4tzUK6d0ILWr0J+q+qnT8sQTWNSej+bPJR38/JJNoTLJqklupWIe2tJruFc1k+XBBcOUb0gVJ2A==
Received: from [192.168.50.4] ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id ef14-20020a05640228ce00b0055d18d6a586sm5663612edb.13.2024.01.31.02.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 02:35:52 -0800 (PST)
Message-ID: <ddc0b42c-bf88-4c0d-b938-8bd7ff7b329a@tuxon.dev>
Date: Wed, 31 Jan 2024 12:35:50 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] watchdog: rzg2l_wdt: Check return status of
 pm_runtime_put()
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240131102017.1841495-5-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11269AD7463C9C7C0A09A43A9867C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB11269AD7463C9C7C0A09A43A9867C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 31.01.2024 12:32, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the feedback.
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Wednesday, January 31, 2024 10:20 AM
>> Subject: [PATCH v2 04/11] watchdog: rzg2l_wdt: Check return status of
>> pm_runtime_put()
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> pm_runtime_put() may return an error code. Check its return status.
>>
>> Along with it the rzg2l_wdt_set_timeout() function was updated to
>> propagate the result of rzg2l_wdt_stop() to its caller.
>>
>> Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - propagate the return code of rzg2l_wdt_stop() to it's callers
>>
>>  drivers/watchdog/rzg2l_wdt.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
>> index d87d4f50180c..7bce093316c4 100644
>> --- a/drivers/watchdog/rzg2l_wdt.c
>> +++ b/drivers/watchdog/rzg2l_wdt.c
>> @@ -144,9 +144,13 @@ static int rzg2l_wdt_start(struct watchdog_device
>> *wdev)  static int rzg2l_wdt_stop(struct watchdog_device *wdev)  {
>>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>> +	int ret;
>>
>>  	rzg2l_wdt_reset(priv);
>> -	pm_runtime_put(wdev->parent);
>> +
>> +	ret = pm_runtime_put(wdev->parent);
>> +	if (ret < 0)
>> +		return ret;
> 
> Do we need to check the return code? So far we didn't hit this condition.
> If you are planning to do it, then just 
> 
> return pm_runtime_put(wdev->parent);

pm_runtime_put() may return 1 if the device is suspended (which is not
considered error) as explained here:

https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240122111115.2861835-4-claudiu.beznea.uj@bp.renesas.com/

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju
> 
>>
>>  	return 0;
> 
> 
>>  }
>> @@ -163,7 +167,10 @@ static int rzg2l_wdt_set_timeout(struct
>> watchdog_device *wdev, unsigned int time
>>  	 * to reset the module) so that it is updated with new timeout
>> values.
>>  	 */
>>  	if (watchdog_active(wdev)) {
>> -		rzg2l_wdt_stop(wdev);
>> +		ret = rzg2l_wdt_stop(wdev);
>> +		if (ret)
>> +			return ret;
>> +
>>  		ret = rzg2l_wdt_start(wdev);
>>  	}
>>
>> --
>> 2.39.2
> 

