Return-Path: <linux-watchdog+bounces-2564-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A89EFEE0
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 22:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59435287D0B
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 21:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4061DA60F;
	Thu, 12 Dec 2024 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAnVga2y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9354219E971;
	Thu, 12 Dec 2024 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734040773; cv=none; b=dUPobGpdVpX4ZJmaBpz38saRWKC0q/NlWzwXi2YU/5HofHudmHabd+8BzkWOC/36fKnIlZwCZN3U+fRHvkcvrwsHLtigsEh+vEJcgOv/se40DR0eODGs4bTRRm+zvmnbWkZAu/X4UxdgKtc2nXG9vp0hLpIWWmfzeOIXZF6FFgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734040773; c=relaxed/simple;
	bh=0Qcd1C5ekZDwZRlvntarCvboFADYCqBWFhVLzL/bV/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDmvkDIWeF7Qw67uUtQusGJaYkUYRK0n1ZtA1h7mnFtPonVKSMWHHM1JD/AcOKhjEeIE4aXEDM0jOXbD7seZFwaexiRQ0gx9LEhoQHJQctQ73yNIi9KsmayEzeVeUEcy7qtGs8paKEGtSZAiuVwgCQB65GYAjNdQw6RZUyPW8lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAnVga2y; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21628b3fe7dso10193995ad.3;
        Thu, 12 Dec 2024 13:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734040771; x=1734645571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=A5peXfR2vV2MBIAnwlkieYycRNFeSbPFid3Ej/BgX6c=;
        b=eAnVga2yyuzifgA/m8syJjVRCAayDrJGUFHPqX+KzWjaebzmL+49SCAcQvDB3AZZaq
         bY7QF8YhnMJaSM4g8axBf76458dMRshjDKKuuc9CJ283H8j6gObizl3/GS9Qa7KylVx4
         S1CNbICAK/cvTIgf/t+QQhDTfRM7qr6qDZbZkJZETRuuBDKjSLl6XwAg/Kbm60xtxMTp
         UD1q9Pdh0DPOgkdDkm21fy94LCsTYBRlv7YUs4B0J6Ej+QDf5xrDK6SSH5ieFl7d8GgP
         2j4UG3GAhy+vmRhmv6wnOPMTHf6RBwcqO9QryUCW20uCLH6Chi6zrx7JFC11PCUA0nTH
         w9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734040771; x=1734645571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5peXfR2vV2MBIAnwlkieYycRNFeSbPFid3Ej/BgX6c=;
        b=boFxNHVGK+wIBPrl6giPZOJgsRmkzSaydi/qGVu8EBXvxT27CVL3ZuIfSictYdCBbn
         J29R9XT/vMdamvpYfj3eCts/Ecy5EDHMgm0Mu3dlUKGgnPCm2cVUXwmbEYSrDxTHz0lV
         SVOP+dHctm+wqz0IFUzwN+Cldzg9mH065+dql5/HT0L8ld20uZeO8ugGnkzDheoTTzte
         gl0uRec35908Z3CkqAPuwCkQ40d5Wy+IMOlcjXMTmLUQCN6691e4GAqikknNq0j4uivW
         6VgzEFr5CuxHuJ6oqOZREL4iGK3yKuLdDre9lD0w3V4wa+WgNEPGFCXlg6rmESXCNzxw
         uxYg==
X-Forwarded-Encrypted: i=1; AJvYcCWzdMtPc7DdYhrmCzDSXcwqWjPmN+nKIXFWHo2jKnL59YeMRSbq0ac0Q91kFEPVkyh0cI6TUVZTlmbq+IujpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXjepJQrwlf7obmJgdZNDlJkQdOkfjjSrzWfKENA0K+6aHbu3
	lP9MvArAZQ7jydIGXH92ylx1Eo5yuxIglrUAxMEHdkTnDopnuBoV
X-Gm-Gg: ASbGnctI8zl2iNNiTgFk7+A2lXb72smdOMgVOgF94NO2ehz1JWyABGjGvxBPt4pmmmh
	xwLY8p1BgsieeKM2/s/bH+lZPszrDoDm4hGnB8o2OWDSHBiorQ5cQK5uj88oRPSiY9V+uHrPTDJ
	Uwxgsh4qWdBAyPeHdbC7Q28qarBy/fGTgiuQGL263G9E4yBAtVDw8yusE7a9JK4CKmjOZPrR//l
	gT5x0/KxWe0pQo/PV+lv1kIP/La0o3J9KQtLD6lL2/4a0ugwSaGSP0znnumkubBZ5hYvfVSbtRf
	ziMOhDOt6g8pphCHier/PRl0kCHvGQ==
X-Google-Smtp-Source: AGHT+IEpJDQV6DF8Vr9O7nQZBmDdruqjLhvmTkraVciT329i7zf0IVZ5PbHY1caaMZrlc86M/3txQA==
X-Received: by 2002:a17:902:f68c:b0:216:48f4:4f1a with SMTP id d9443c01a7336-218929c3556mr4085375ad.16.1734040770669;
        Thu, 12 Dec 2024 13:59:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156e1e20sm12967544a12.32.2024.12.12.13.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 13:59:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <648b3de2-2055-405f-8624-8e8bab584311@roeck-us.net>
Date: Thu, 12 Dec 2024 13:59:28 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: da9052_wdt: add support for bootstatus
 bits
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20241210-da9052-wdt-v2-0-95a5756e9ac8@gmail.com>
 <20241210-da9052-wdt-v2-2-95a5756e9ac8@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241210-da9052-wdt-v2-2-95a5756e9ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/24 07:24, Marcus Folkesson wrote:
> Enable support for these bootstatus bits:
>      WDIOF_CARDRESET
>      WDIOF_OVERHEAT
>      WDIOF_POWERUNDER
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


