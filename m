Return-Path: <linux-watchdog+bounces-2983-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A047A3EC09
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2025 06:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA943B5052
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2025 05:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173401D5CD4;
	Fri, 21 Feb 2025 05:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uv8AAXtb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8A8F6E;
	Fri, 21 Feb 2025 05:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740114252; cv=none; b=p1JNHD/LJmfl0pOLgkuAr83CEe7hRHfUOTaHmizwM2/WHZ7y1jY5tWO/rgQk7c7sadNDR3EN9jmBH3SD2n37ZAFbZQr6R4W1viHT9A48uunthO9wER+UJol+/gnZD0GBxco0aYNTrEX3UQILFriZGyV8eiNEzo/265VPHIeno5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740114252; c=relaxed/simple;
	bh=kVTR8IJ4Z9u4M0lwBoNiPD7OySizW4YwJbNIeyGYlJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzp4g/XPXpyMM9ZVQcxYlz256PNyKCdqVZoTJVoD7KsGMjfsZMb7Gv2YqLQVKPIfRB7eT7dzmG1MNE6/vSrej/bJ/d8g8bp13iICkYo+qU0Yp9B+/Ybi7HuM3rqeBadLAGpxjhSKFK43u9hQyrtan19TcZGs/TDSXN+xzCubhxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uv8AAXtb; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso2638657a91.1;
        Thu, 20 Feb 2025 21:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740114249; x=1740719049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=d/YjHIl4MLUZ7m/n9NrNUds4XgLY1mho7Ntomm2vqws=;
        b=Uv8AAXtbfvdR0ET0AL/WAHSzLUelzmOK0oDuSJ7TpFbUY1SinWt8+SJ5Rg+ah13d1O
         BlmvyIp8pdDdRQnOgOXnD0WjftFvWOeMBuRZvdGbJ/hgwDiiRWVvmtDv8eKdJzbMnpml
         z5tC+cOjjVXjwQD5faxhxzoEyRAyp+jy1Xv1tkF3a5vuHGzvVtJEpOomEzLEEZWL4M4s
         /9n3zfRIRGSoLoGRPiMuycsBM7FLDzHbaCBZqxnRcNcRyIfQlWO2fS9CBvtVcHjqAxyc
         TneevVoxj81ie94ENJCdyPiejTvm/Oo9dN6vjIq8qWj748ppKfwzHVvTRh1n/K/ynCg8
         VNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740114249; x=1740719049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/YjHIl4MLUZ7m/n9NrNUds4XgLY1mho7Ntomm2vqws=;
        b=Yznu2G0rQrSNtzvdenANdty6l1IiUdc0yT0cyMYe973MmfLhSMFC7cZW/Ji2Kee172
         CuMPr2uJ1M8iGHEFSN3P3r11naAacJjUtjYYxasIQPICZ2eAxmOpDjQ7wox+EYItxAFQ
         LR3fk6Jf64ZQbTcY3Q2bqF+6nbmKux7/3VvTe/sh35vWkVEi7ILnssxtaCT7rSGvO56l
         XNh23BBrSt7IQHLw1doEWKhFO6ITGe/C5q/CP235oPQaS7gQYB7S3Vs7i4X1pov7Mvxt
         z/IZNifRYJAyt7JQ84hP+AHRkKQ/Ia0oQyI8pJOM7NjzZpsws0sMacPhxiwzwMkj1iQw
         2mVw==
X-Forwarded-Encrypted: i=1; AJvYcCUlaaE3jJRyt0SRo1rwkDUMcx/ju/Pu2O+ZTsvBz7O19S46MfAXr3HVL7Ey5BRg8FKkfk0gjqFNAUw=@vger.kernel.org, AJvYcCX/6a4X8/XDV8GZ63mjOZufuNf7xn4iAnUIlsDapAd1eyhuhpIxkR2CYZImhSLebJiIZcPd6qJvQVBzjPhN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2r2upWXCldRp1Z5we9arQkzOyiQkSuZwoQ6HaRHbsuFstNelL
	AnsdAX+jlGTPsQi2WMq2KG2Dzve569hHKOS3ERi+LASMkSZGEJYzSzNOMw==
X-Gm-Gg: ASbGncvTuRQwfP3UdLNXFKxVz7s7peLBJxTnJwbTLnhoOxmmBZTTW7jlqDE7c3dQoAh
	fxEdKL+elB5GzYkX8PbXN4AUe1jee88vfI/ZrEHccOSsf7J4DWzmp4jJwWZ4FhQfxd7XrVA/7aU
	Pfz6JrtsAOt4gRq/auOYjr8F8ChypS8t0ti3T7xR3gu0rZ2G3N1Wh1M9/+bZSTThJ0t6cxG84rm
	OZPS1E5qzT/famtmdD50EdjcInY69imf6yCv2/+pJyQErtgh8RBnuqX9Gutw9aE2nwUYs6x8twS
	bsqKWhpjappLs/hZlkf9xuFLjFIM9vHPFc4vuYsYPNOfpZpUCyzbXW1CTI5UR2gheBSqmRmaWe0
	=
X-Google-Smtp-Source: AGHT+IFl8E9K9CJxLxS8d6FuGmCALKpm+fOI3OWOUHGgwwY/cSdQ+FJl+iFMSmHYi6L9aQSriGaFJg==
X-Received: by 2002:a17:90b:4b91:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-2fce7b113acmr2717295a91.26.1740114249310;
        Thu, 20 Feb 2025 21:04:09 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb10fb5bsm337924a91.33.2025.02.20.21.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 21:04:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <753aca13-e576-4784-80a5-ab8c21e92148@roeck-us.net>
Date: Thu, 20 Feb 2025 21:04:07 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers: watchdog: Add support for panic notifier
 callback
To: George Cherian <george.cherian@marvell.com>, wim@linux-watchdog.org,
 corbet@lwn.net
Cc: linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250221023550.2092232-1-george.cherian@marvell.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250221023550.2092232-1-george.cherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/25 18:35, George Cherian wrote:
> Watchdog is not turned off in kernel panic situation.
> In certain systems this might prevent the successful loading
> of kdump kernel. The kdump kernel might hit a watchdog reset
> while it is booting.
> 
> To avoid such scenarios add a panic notifier call back function
> which can stop the watchdog. This provision can be enabled on per
> driver basis if the user wishes to by setting the flag
> WDOG_STOP_ON_PANIC from respective drivers.
> 

I think this makes sense in principal, but it should not be driver specific.

Guenter


