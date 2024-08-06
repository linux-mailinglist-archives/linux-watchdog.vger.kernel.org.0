Return-Path: <linux-watchdog+bounces-1457-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87F4949291
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 16:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1B6F1C2158E
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 14:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB5B1D618A;
	Tue,  6 Aug 2024 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPJPy4+p"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556541D54D1;
	Tue,  6 Aug 2024 14:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722953003; cv=none; b=UGG9u8Vy9mSD873FAt6rIyqN3It4ZvZazR75Jryv2jOdVL0e2BQtVvbBtYtaxy7ahXaW5ImsHNMO8rqX58iyMqoV6vYt9dBNzKYS0B/UM6z+XCENubqrzi1BsUuYi+hN0D99M5N34mtc55MzNLi/ousvykWeEdZrauQWSdohcoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722953003; c=relaxed/simple;
	bh=BgtXdTWrF/uVjmONeyxVuYhWWob0LQsLCLOoPBwmuuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxsHY6h12Rqex3p40KJdceWXxy+uY229497IFBY9LBerJ7U2OxCj2rJoMpxiI4tbaQIEJ6reyrio/MnibcOaO1xZkg5QywgbtM9BtkW8Ge3Esl8ZL5QouLYeARcf5B6rS71SHDluJraaKS8pE6t48aSBARJMIqZzTmsJcjpcoSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPJPy4+p; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc5549788eso5531505ad.1;
        Tue, 06 Aug 2024 07:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722953000; x=1723557800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1WuLsZhsyVi84fddIjL/eS+CsAFFvv5htC93Qn3A7hU=;
        b=jPJPy4+pZHXEsVS1QuBJ2LlFQQDJmh04TjjD37h0A9+rR+BLwTeywtulIKMy52IVNP
         G/Rxlnulfc+LMyEgfDhLpVjrT9U23Tn6TA0axC5X5O2yX4YhHaAKni4zzKPtZEf9FAY3
         RulQbA6sLzZ5/6BEBnx9JwnwGKREJPQJV3yW70J8hos3ub4Vr5+yDg7jz8j3WyAVTdKq
         vjIbvL2AZQz7CgfP1PqYdxQXhwTqODsnPS5QqA12se7Nae3ETZIu/kABT0NGiBfXtvtp
         Dj3sc0TCzk2QFoHSqsUKHHxvsXgPmjG3lKogdJODAoQC9clKFxRB387BbWOH9qp/BXj8
         yibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722953000; x=1723557800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WuLsZhsyVi84fddIjL/eS+CsAFFvv5htC93Qn3A7hU=;
        b=ADjf/EpNEKtGPn2i8nyNPoXAUQz7PCBK7uV1viEaHoWVGjoY1O1HJD0A5q3EEx3xSb
         cqE5UskxjSkCznc2QG0RvNrlC3zRfGrepZ1mKzM5+pNqtmVmN310jKt0CyFYCWOZiKCF
         nualxHAoqCKeLva9iRPVn4OhD7KT7M6MBRiYhjEeV5HDLGsR/ly3fVOJKXBUsuT4rXTF
         SeIJcYUcX3nPsgjMBTTYOUvcPxJhCsSwoQJwM99zolnm1CSP5cszvZSY0Y+qCGMZrcrk
         Lr4Q3tmDN+BFaFJqgez7al3Dgs2LX3zbzMYRnFHYkV1tSH0NfB7HW9jiGPOtkr1i4Fy2
         twDA==
X-Forwarded-Encrypted: i=1; AJvYcCVI7oCph93kB1cNwHfsDDAAKlyAgRR4KRxtcxEdBOO0G/53D1l+y29QLOJjX9mHhXUIPbpXOA5mCiYudAk4WgXQ8fMescTNcLu04CmnTXCR0hUgF5lBDoOWLMgGRP1l/H4zTeqWEVYx4Z3NYl0smSmYHdljRpk6Ftk+7ivOTSC1ay6ULCA6niotLKySy6mhRXt18xAtFqrXraWl06Hdh88vHIBGdha6TFCuSrQ=
X-Gm-Message-State: AOJu0YxbIIYwnGvAR3GTxJB6t2AEqNx3Qtl02TrX9YFJP3CpPfhmJWEw
	dG5ld7Go1D86Ajb4s+gW8UGKBbnjdTOM2R3jsjRG1jONuuz4oXBY
X-Google-Smtp-Source: AGHT+IFuLufyJ8wkFRQLobEpWemkrVv3rhhHR/Eg39XpVVarxeMoL124V5V7CMxLZsS6jlolI1JCiA==
X-Received: by 2002:a17:902:f213:b0:1fa:ff88:891a with SMTP id d9443c01a7336-1ff5744b232mr142432635ad.48.1722953000326;
        Tue, 06 Aug 2024 07:03:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f29e18sm88462975ad.11.2024.08.06.07.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 07:03:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <45d4760e-17bf-49f2-a139-d79a0202b630@roeck-us.net>
Date: Tue, 6 Aug 2024 07:03:17 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240805200400.54267-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240805200400.54267-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <81ac76eb-8b43-457b-80be-c588ac4790e1@roeck-us.net>
 <CA+V-a8u0dFGmNqJWuXXH3mVVTT6dWBhSr+SM7nFyu3DAeACjNA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CA+V-a8u0dFGmNqJWuXXH3mVVTT6dWBhSr+SM7nFyu3DAeACjNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/24 06:47, Lad, Prabhakar wrote:
> Hi Guenter,
> 
...
>>> +     /*
>>> +      * WDTCR
>>> +      * - CKS[7:4] - Clock Division Ratio Select - 0101b: oscclk/256
>>> +      * - RPSS[13:12] - Window Start Position Select - 11b: 100%
>>> +      * - RPES[9:8] - Window End Position Select - 11b: 0%
>>> +      * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh)
>>> +      */
>>> +     rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_256 | WDTCR_RPSS_100 |
>>> +                     WDTCR_RPES_0 | WDTCR_TOPS_16384);
>>> +
>>> +     rzv2h_wdt_ping(wdev);
>>> +
>>
>> The need to ping the watchdog immediately after enabling it is unusual.
>> Please explain.
>>
> The down counting operation starts only after the ping operation, so
> after starting the wdt a ping is issued here.
> 

Please add that as comment to the code.

...

> Ive now updated restart with below, so that we dont touch clocks if
> they are already ON,
> 
>      if (!watchdog_active(wdev)) {
>          ret = clk_enable(priv->pclk);
>          if (ret)
>              return ret;
> 
>          ret = clk_enable(priv->oscclk);
>          if (ret) {
>              clk_disable(priv->pclk);
>              return ret;
>          }
>      }
> 
>      if (!watchdog_active(wdev))
>          ret = reset_control_deassert(priv->rstc);
>      else
>          ret = reset_control_reset(priv->rstc);

Please rearrange to only require a single "if (!watchdog_active())".
Also, please add a comment explaining the need for calling
reset_control_reset() if the watchdog is active.

>      if (ret) {
>          clk_disable(priv->oscclk);
>          clk_disable(priv->pclk);
>          return ret;
>      }
> 
>      /* delay to handle clock halt after de-assert operation */
>      udelay(3);
> 
> 
>>> +     /*
>>> +      * WDTCR
>>> +      * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
>>> +      * - RPSS[13:12] - Window Start Position Select - 00b: 25%
>>> +      * - RPES[9:8] - Window End Position Select - 00b: 75%
>>> +      * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
>>> +      */
>>> +     rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
>>> +                     WDTCR_RPES_75 | WDTCR_TOPS_1024);
>>> +     rzv2h_wdt_ping(wdev);
>>> +
>> Why is the ping here necessary ?
>>
> The down counting starts after the refresh operation, hence the WDT is pinged.
> 

Should be covered with the explanation in rzv2h_wdt_start().

Thanks,
Guenter


