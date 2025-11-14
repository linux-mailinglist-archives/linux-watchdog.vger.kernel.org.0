Return-Path: <linux-watchdog+bounces-4586-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 027A3C5C3DC
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 10:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02B064F9055
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 09:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D0830276A;
	Fri, 14 Nov 2025 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSpky67w"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518932E719E
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111830; cv=none; b=tZg30CbSw7K+qqvZQA0drcXmoNmSlgWo8YdH5KpV66EiETztwFb3ARW04pd+CwPHlIDYoNOlQeylZasswXJm0OlNnWRMEywJMU6q1V5YtQJIUKeFijTWn1hZ60C8sUacw3cqVXd4gjjJ6lov5ej2fHNKP+FORohSHj7J6r3pCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111830; c=relaxed/simple;
	bh=Ryn6T2QutqODlnnegyDDGaEuyXm4fLKOFdCqKJZymwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7+MQSUhdOtmBdpNCl3FdhopICYYwyOHjuO9HKw4Imj3SZAD+m34YLndBPD85pQ1PprsrzbhkEQ3H79b3iIGzCeU49VLtOkSGXHp1Zx9ObPMp7zng++tbDR/4My/KQm5cfFnRQy5vJ6B5nmQhfv4a6/+zcq0MChDt0u6i/SLnOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSpky67w; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a5ab1e81fso16089931fa.1
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 01:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763111825; x=1763716625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAxHv1d5vD9c04qH8QLP3dYYfxw1aIXGakmIUBX/9i4=;
        b=iSpky67wYusLWYcDMhwgYfQYp3eCnY1ANDxZp27DangP31TDScPK1DT8rXuDAFHZoL
         lkqsTmUo13/2BeZUIJAcV+NUJ/v5OvCR8qlZ+VJ3M45zIjisDXBKfbt8RacDkXLhX+YZ
         zuSAKfpdeMpfOHJEbgPl/oGYuEUEWe+QZA++miT9nBIT9VyJZiI58crkdzd4u1QPd3WJ
         skHrCxtlwqfECNSz8S2xBaDHeG0Dqp5xKDeMZ+7NFZ4sVYGgyz/IIfNHofFoPvbNmPRv
         qJ6gsd98rrBkhxfKJbT0xZMLe/pZ2HApGX0EETJdcB1rgOrHJGeHCuGb0WxhjqzJblvb
         OByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763111825; x=1763716625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAxHv1d5vD9c04qH8QLP3dYYfxw1aIXGakmIUBX/9i4=;
        b=vxZ4620ltk3J7E7DAw1qxeapRj0mJ8IAtG3zjMYC6MUx+8EJwS0sNt2algD99Jso6u
         H1ZFYE873BDibxt3jdda6nTo/gjs5QIXizWSUnfPRJiL96tSAZUwbATUBRXmA/qzvdG8
         0a2XtUosypLEXwCnFduFWALrS+vy820f+WdM8kzT7Gb86ob8ZQa9U4bMqPPJyZW5RNoR
         g53KmXxdMxyuU+KftbC0w/FMHI9xQwMUL2GlrEMTTG9IqaqjrW7lkOBDipOC0oPfLgar
         1PpZdvJdkJYWJqxlaweFriWLUXf8BskB7yKhHWXHUTHIoiA/dUczXqj+fqV6Vk1LVKp0
         8Yqg==
X-Gm-Message-State: AOJu0YwoBqgulbK5c7basEYdQFPEG883QF5JSx5rPE2J1vyo8tjgH7ih
	+SgdPAOqMemDmKHuXLEPbvBl1zD5poyxRkallV9iDdnF75tLrB1aLt7a
X-Gm-Gg: ASbGncvJIGkS/CyJjeXPfgHr3ON/pHaiWFveJaMW1Pr2NrR88wIVYoBj91HO7wW7HOH
	c6jvGx3qEKC3fP4HPNew4TTlmdbAtGw/1RNvhq2uwpP3ardfAi2hMIVUCqQX4FrV2LxsKmxe5FH
	t7kEgDUtIii+b8hw9hNf8nayYYCERvFSxx/0sx5vIJ3SfQ9gqFPrD5ePGaHdfd9I6MD5iRCrHfz
	6h0sTOVnUTStUmwDSub6is7+nloL1Mo4AyRY51swoI5ZxJI8vMmReKeXHtVqE47H0zQm+2PnqD6
	YBa2I9yEGOgXqOK0mZELShscTtdimCb1O6M7ly2sedfIuNTqEe5XD8HSGnR5mElcXNstyw516r5
	WGP9ZRmLBWDqO1Vr///o6afRSDsO+XsKhu3briTPcF/Hy/lduJvTcrJFeqq9tU7WuAGVQm2Vtca
	A9x9as9u/+WCpFRCGahkwyOBCNHTAWrcmcSXjhsL2tbOCuawNqCHPvEqkV2Q==
X-Google-Smtp-Source: AGHT+IGfp/cbYhvwArMuoDL6z/bjg4bKUiqfCwZsY1xcRrhXinTxzbrt4FjjI0mKTKxdDxn7Vej6fg==
X-Received: by 2002:a05:651c:3055:b0:378:e0e7:40cc with SMTP id 38308e7fff4ca-37babbe3a53mr5178241fa.19.1763111824576;
        Fri, 14 Nov 2025 01:17:04 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ced4acfsm8699601fa.30.2025.11.14.01.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:17:03 -0800 (PST)
Message-ID: <b31f5017-eb85-43a6-99f3-5eabc21841ad@gmail.com>
Date: Fri, 14 Nov 2025 11:17:02 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: bd96081: Fix a spelling mistake
To: Chu Guangqing <chuguangqing@inspur.com>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114020502.2009-1-chuguangqing@inspur.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251114020502.2009-1-chuguangqing@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chu!

Thanks for the fix!

Hm. I suppose I missed the v1. I agree with Guenter that a change log 
would be nice. Then I knew what was in v1 without looking for it.



On 14/11/2025 04:05, Chu Guangqing wrote:
> The spelling of the word "initializate" is incorrect; the correct spelling is
> "initialize".
> 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---
>   drivers/watchdog/bd96801_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/bd96801_wdt.c b/drivers/watchdog/bd96801_wdt.c
> index 12b74fd2bc05..43ec23c53e62 100644
> --- a/drivers/watchdog/bd96801_wdt.c
> +++ b/drivers/watchdog/bd96801_wdt.c
> @@ -370,7 +370,7 @@ static int bd96801_wdt_probe(struct platform_device *pdev)
>   
>   		set_bit(WDOG_HW_RUNNING, &w->wdt.status);
>   	} else {
> -		/* If WDG is not running so we will initializate it */
> +		/* If WDG is not running so we will initialize it */

I think it would be even better if the 'so' was dropped. And, as a 
matter of fact, I am not sure the comment serves any real purpose here. 
The code pretty much says it already. So, I am OK with either dropping 
the 'so' as well, or the whole comment.

With that:
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

>   		ret = init_wdg_hw(w);
>   		if (ret)
>   			return ret;
Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

