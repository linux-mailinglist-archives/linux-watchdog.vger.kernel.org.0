Return-Path: <linux-watchdog+bounces-1462-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAAB94976A
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 20:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C88AB283A21
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 18:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C7062A02;
	Tue,  6 Aug 2024 18:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drXzc8GY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5039128DD1;
	Tue,  6 Aug 2024 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722968282; cv=none; b=SeHYRBEct++Zds/JT8XaVA4PHAfyjb2KH3dN4RCEo2W6Jc98hSLAMZIHykC76MESB7rBiExMhRXVzq9chnOQc5ET8hpZQbPAYcfJbURW+XuRKvDs2pmauDwAx+Efq+bDbzeAmpN3iCIjDZ/oLkSGx+DOZPtGkRtDXtr8LyRiPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722968282; c=relaxed/simple;
	bh=HUpcZf5EKvHYyduu+f4aMQ7rAKMPRGq0CRu7jv8IU5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3xjAp2kqxtcUv3if//GPzJ4ttiykEki/hcWpzAOjrOewbWbbD5YWfY3hFJAZhuAboO8oau4pg0w86sOLjsWX+bA8mhcEJ4Ts/Hsr22ogmk+Z0Pt+WO4Zmeyt5bXKE8KCifNNkVE+2KzvuKzcOd8XA34G4fvJk6ifFsBp3l6Do8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drXzc8GY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fd78c165eeso7615415ad.2;
        Tue, 06 Aug 2024 11:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722968281; x=1723573081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0qgmOJBOVyTjbprYZEKVF9qltuCiisjLoD4Cqcby3Qk=;
        b=drXzc8GYO8HsGNCz9H36En3Gkyl1rnPG5cRklxFkSmnpntiKdgAvyqW70DPQryq/ye
         eNd+nNA/Jf1DdoV2zwakj70LOnC1o/Avw8DNld/tON2taSk8jYxSfhHupqhCJrPs/r6q
         mSofRhe51dlHNuVgYZDaiVClFPAmcRXBIGwIG/hGhwDtc0Zi5vAo3h3d8Bood1C0KVjG
         4X1r+aIgrYTmjPg+0axVnzaS9ce70smDeEgJ73B+7zaRQBLGyblIRahWOce2iGPASMw+
         eWgu3IRR4bR7uZJQBq8AGnDlKqqJbj0CQJMR4o7SMCO8I3BuiIQ9waA38kORtVw7B1hv
         aEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722968281; x=1723573081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qgmOJBOVyTjbprYZEKVF9qltuCiisjLoD4Cqcby3Qk=;
        b=Ch/RrQkHLtyIkAViljM024xP7R2e4RdRkwFzZ+tSPwbbJfKt3CWEGkxqygRh87kE0e
         pmhBXuERMaexfdlvH5hmKqBuH2iB+cEjVtiLuLFWEDVmLVbFOadUTAJxcPJ1xEXAEN/l
         /6HpY004DMb0nATcM1PW7sXw0nBZdjjF2Ygxh7akj0ZL6sY3eSlahXY17ZpG2EtoV1jv
         BEfCRQi02iA6t2mZikefi0vJ0i/v83lHd2/ixXhzJPC9YqYEBXJkEMM5UI1h2c4hsN+k
         aA+lgtGip0x6EVmBVJQI/WBohbmP8daVK56Tbx5UsKvWyfgP/v0uy6MHgFoq68pfnzvA
         XAIA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Z6McBT9/oZPN/DNh14Y3dh2SUIYgwqyootvu9FlsHTrZ9nxjHRl7dc4NKh/ThRxzPg3h+Q/sttk8sNzOAH7hJw/Km9e812HV9sZbo9DmjUoikLgXD79zJ4/SOlPhQ7N9Azh106xsdCHVw0F06UfXesm/PG3oGk+6j7r1XuZs5Ov+8jqXrUw=
X-Gm-Message-State: AOJu0Ywwnaxai/cM0J4+hnb+JLDRH9N/cj6EXpaTyY18KN2WTaiVoHcm
	w3raUNXK6nq9ceuJWIROLRSmIkQYf1ETA7v/+/co8+KJr2XVx1i/
X-Google-Smtp-Source: AGHT+IFV5/xcTBPwVnhSX+vbxtuqdREBY7t7TXnUzNivXFGQkBf1YxxnVhtELswcug/NUj/rocveXA==
X-Received: by 2002:a17:902:db10:b0:1fb:a38b:c5a7 with SMTP id d9443c01a7336-1ff572512a1mr234357895ad.13.1722968280627;
        Tue, 06 Aug 2024 11:18:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5905fec0sm90626515ad.149.2024.08.06.11.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 11:18:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7b7ca7e0-6bd2-45ab-bd9b-40331a8e6fdd@roeck-us.net>
Date: Tue, 6 Aug 2024 11:17:58 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Capitalize Fahrenheit
To: David Hunter <david.hunter.linux@gmail.com>, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
References: <20240806174038.708025-1-david.hunter.linux@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240806174038.708025-1-david.hunter.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/24 10:40, David Hunter wrote:
> Captialize "fahrenheit," a spelling mistake.

s/Captialize/Capitalize/

Also, this is version 2 of an earlier patch.
Please read and follow Documentation/process/submitting-patches.rst,
specifically the information on how to submit new patch revisions.

Thanks,
Guenter

> 
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---


>   Documentation/watchdog/watchdog-api.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
> index 800dcd7586f2..78e228c272cf 100644
> --- a/Documentation/watchdog/watchdog-api.rst
> +++ b/Documentation/watchdog/watchdog-api.rst
> @@ -249,7 +249,7 @@ Note that not all devices support these two calls, and some only
>   support the GETBOOTSTATUS call.
>   
>   Some drivers can measure the temperature using the GETTEMP ioctl.  The
> -returned value is the temperature in degrees fahrenheit::
> +returned value is the temperature in degrees Fahrenheit::
>   
>       int temperature;
>       ioctl(fd, WDIOC_GETTEMP, &temperature);


