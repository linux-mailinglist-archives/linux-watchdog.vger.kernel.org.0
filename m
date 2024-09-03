Return-Path: <linux-watchdog+bounces-1667-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB289690D2
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 03:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A5BCB21555
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 01:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11E91A4E6F;
	Tue,  3 Sep 2024 01:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6l4Sxt9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453EC1A2C10
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Sep 2024 01:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725325500; cv=none; b=PVZRKjZPno1fSxc2NvsSQwBbLH0RU8oTN08nGljYbn+xGJbtMscIIZrjKb63aqFE1a+oGzLwYtcXO9trrfjJM1AJwwF+yFd+BnjyrEh7PRWprIVNDaBY4OOhWNYDy7eaj5K4lqyPYFw8oXAce9gAs/8SsZLNeJMA6TvTD5W/Zhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725325500; c=relaxed/simple;
	bh=SmjC176TIQtcvHWlJB1u3ek/Yvl0ETwRFaY9+VKyBjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1EY1eyEITTtHpYAk8lRP6io6jSx6iqE0mqK2siZ3pULLr782hfG7JMsvnudW/wTk8o883VUvX26CZBSjTwRZAcwOzTMCedjJ2a04nJCGcmnCrFIbKHFqRftkrHyXZTEBA08D+IWmnJMm43VpUoNlAmGk6KYOY0V3vjGZWh7Df0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6l4Sxt9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-205909af9b5so7797295ad.3
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Sep 2024 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725325498; x=1725930298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dwiY8n0jASWSdDEClXRj7NKz3dcGAQzGGaZQ2AEChWo=;
        b=i6l4Sxt9QFRHnTu/YvYnOzwcDuZ0Sy/m+RhDVNvF8Fqk4Oc0WM7IIoPV7226f527ix
         RnutVE+bFflZN+xYCVVNL65pDzn/M856q5DEUD3LW1MsmMDuxRACBa+04XCqGtOR137l
         OkdQ3YdMRE0ypdSGieG6CjTQ3nHUx9FG0MIrJijNoR5FIab+qxyrutxjaxOTR9TIXnMV
         xFty8C9KGkPbWJxCVgGJtbHKhQaZzWgujU38t2YkszW3cPg0ntbRy45v0PvIRtUISQCX
         nLoLCv4onye2kOwb9CNdA4oxjNDOQDPHkaDe2CuYXXz98EO7Q/AxJZaRssSuiNCXN1M5
         IKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725325498; x=1725930298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwiY8n0jASWSdDEClXRj7NKz3dcGAQzGGaZQ2AEChWo=;
        b=JcECS8o0L2Xwl0F3uKXy8XVCotRSuLGTwg8Y8/8a1NIlh6iRQ/Lt0MqH+4CE2mTfoP
         2ZhcaUacAOXM0cuIqAI9zAm1uYSDk6hRi2H3VTt8rZlXXYys4MQRkP7cBnerk2i0KDD/
         bqZiQA/HIchWxk8wH6Ex878djanQax5WNtvshqbnctVxIwS+nQlJMe7o5JCKSmRswDFE
         xV6q/lT5AN89u743vhY4LcNWX8Uy1/fTX/1cggICYUKdwB0EpK7OgMh+eT6R+o7DqXZb
         RzhEJlkrpcD+Mfjmn0rqYd5E8IkzjMRPb9JxGkwOO2SjJAuNXdGjlh54ZAlJvzXXIhTs
         DdAw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8lxpL7AMNOWoeDAabgNR4B/vRnbEbhYmBMM0jVcCvuNgIJ3vDQR57fVdbhfeUvm7PkZjqFo6463KO6SMeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkR3BjG2UAsHbmA2uVxFMoNAamJ8FIx5M+ixfvs3WydPFPHh0W
	kQc2+OX0M134Kn1eTLR8BC6YWhIvrqnBd1TDaRdYcYUACI/OkIFiYKONUg==
X-Google-Smtp-Source: AGHT+IEYIeT908/QkrMFtKVuRXdF6shbhxIhkpubCkSSjbColM0lkyjrsnSXciDJCLBlhbaHgQFa4A==
X-Received: by 2002:a17:903:32c8:b0:205:5a3f:76b5 with SMTP id d9443c01a7336-205841a6315mr52356195ad.28.1725325498398;
        Mon, 02 Sep 2024 18:04:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205528931ffsm37406805ad.45.2024.09.02.18.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 18:04:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e1c952ca-bdb7-4cd9-ad14-ab6bb649cd77@roeck-us.net>
Date: Mon, 2 Sep 2024 18:04:56 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: da9063: Do not use a global variable
To: Fabio Estevam <festevam@gmail.com>
Cc: support.opensource@diasemi.com, linux-watchdog@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
References: <20240902224504.1012750-1-festevam@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240902224504.1012750-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/24 15:45, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Using the 'use_sw_pm' variable as global is not recommended
> as it prevents multi instances of the driver to run.
> 
> Make it a member of the da9063 structure instead.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


