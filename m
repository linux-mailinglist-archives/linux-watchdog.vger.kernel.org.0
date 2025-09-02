Return-Path: <linux-watchdog+bounces-4147-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC1B40A5F
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 18:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28CEA5E3F1E
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 16:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F4D2D47FD;
	Tue,  2 Sep 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CF4I0slo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30116156F5E
	for <linux-watchdog@vger.kernel.org>; Tue,  2 Sep 2025 16:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829815; cv=none; b=XflEkoF9wxHeUNkHl5np1NhERVG6gkitYDWbza7JEtrNnKXfEpPJPY02+FmEPZ0yz93laypPERpi6gUEtrylgeNlOvx3Ejwc5tbZpECqIxtTAOAiWThqnIuRD/r+sB9rcZF8TO+eiI4QrZjmfl85wHeo3g6whmTmHr4X0xcV4BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829815; c=relaxed/simple;
	bh=4smLet63U21kzyE8MsVffFN1zJOiXEyi7QuZeJN8uZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSB2RqANWLZKwoR2fNyol52rufamUkYeqdyczVWeS5fhd4/ISvlTKNQGcIB98SxfqRoItQcznNcAzJz0kd/uT1V9y0138H30RqHmonjwXqt17iUoNhYB2FuSF06LfP5h39vlAEMeBOlDUSLlzeIgKQX4lDZR7BCYL2mNo/1oUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CF4I0slo; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-772301f8a4cso5001170b3a.3
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Sep 2025 09:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756829812; x=1757434612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfTT/0L5kL1Bj/6bdsdzAICO5F5R4CJvks4G8LxlPY=;
        b=CF4I0sloQw8wOZTLxNBXd4G2tSsXDZH1ujlDvYUrg5YQ5jdFyjPmmvDhBDIYw3NVMr
         OWJMx48J95HSlZTQN/X/yohCtb5FCku+uNA+vldJ7T55LvnPtjZMp4V6CRplt2rEwJMl
         8ju5eEYSOCUary9LdoO/7BihjNrIO/2IZhLlgGmHz8kqgPT+zzyG63chIFACvtz1Yvnn
         3kfdBClrRi3eJosDrz8pGIa0T7nXj4X7Iit6StNXwN3+rqED779M9ETbyyGRQMhVoES7
         ab+tYzuzSA76NN/Cda7Zka3QH2R0XLaIOFzVBRrCZu/FznbYxCfCWuO5ckJsBliIQeM/
         sV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829812; x=1757434612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPfTT/0L5kL1Bj/6bdsdzAICO5F5R4CJvks4G8LxlPY=;
        b=isAD5k+D93zrt1MgAjsH67gkPi9X6150guVrLWhPTYnxLVXDEpPPOlmLBAmV4tscDj
         6lFl8CnMIfF1+LkgkGwM7lanxj0L0XxMAlJX65F6ayYVhCIcVKoE74Kxl7+Y6IfFMBWc
         tQlfOOZo2hF5kapuPL3Jic46gic1ugpgG5pHMCHJvvLBYDHKvOvA1KlFvYPWR1AfRvL8
         zBwrMg6mdTNgDHPYoDeWu2R/XzBT1KysP24repgEaQD/r8GRF2EmnD2eS3ohMtF/aiVl
         BIkE+nVyEr1aEz4zaMa4Luo9GglWaItRk3CpCIIaoSZCVqIN4vW6TNcHegYQWLI8Fsp6
         tXPg==
X-Forwarded-Encrypted: i=1; AJvYcCWjmkzhq5Vx9Z0YEQQWr0EhQbQ8JsHhc15jzzRiYplum9+x9Y6Eh1tycyM2iGGu2lz28oScgYkUzYuCaJ7aPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk6eSH0nYzzvr5IRLB3waQazTlYFWI/vSDxfbG7t8LtLsQ6hqL
	OBxID83sGB9r505WNW8x9vu4GPUOoQkEZHp/0gS3kgl070g73G63Zt5WkoFfRw==
X-Gm-Gg: ASbGncvSJFyfIMvcS1KxUkkw2rV2+wLXXvxGqltltY1hcSGG7+5QGtKh2pmJ4hbHiWU
	tdGQ2aPqxu+7dKl9GJybbTOKzh06WyGqqcMeeXO7MDwgnmu1KdqNuI6/53i9GUyl5Jhc1JLLteo
	ghuc/WO2h2jTQDmi66aTn17myZ0eE6TaHEZfJXllQ1SLHUq/S6GCMhN+wFE7HpS/xEaXSTl5ZCf
	nbq+qnw5kCVxNCaWDXo9mGf9S6gCQQR0g6v8gPrTAA9PkY+modRKyckXPdGUqXup2Chuy2N+o4n
	/6C2w1jPWW10K2ivnlo0JYH+sLTL/coG+macdiTgatLjCvmAGCxaozid/QhcuQdtedMVd/4OrBI
	2K9xZPb/f424x+t5DfT8h8iHQclr0edCROGhvKyOmQGc6sku3XVjR3/GFJnlDkDjv/yiYwGAJZb
	SWyPINmA==
X-Google-Smtp-Source: AGHT+IFcDMTwGze+dU713bObEWj9K02QWbbtBiRRxP+/D/gNpUVYXxTdmWP3ORi7JJO/SNQuwYmAjg==
X-Received: by 2002:a05:6a00:2381:b0:771:f69a:c426 with SMTP id d2e1a72fcca58-7723e276e5dmr16996816b3a.14.1756829812165;
        Tue, 02 Sep 2025 09:16:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm521248b3a.9.2025.09.02.09.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:16:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <078b47fd-952e-4ec9-a8b9-c86769ce4882@roeck-us.net>
Date: Tue, 2 Sep 2025 09:16:50 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: rzv2h_wdt: don't print superfluous errors
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
 <20250813190507.3408-7-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250813190507.3408-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 12:05, Wolfram Sang wrote:
> The watchdog core will handle error messages already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


Reviewed-by: Guenter Roeck <linux@roeck-us.net>


