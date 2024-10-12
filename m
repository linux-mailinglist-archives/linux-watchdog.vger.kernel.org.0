Return-Path: <linux-watchdog+bounces-2199-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE599B5FC
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2024 17:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2991D281093
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2024 15:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7D8282F4;
	Sat, 12 Oct 2024 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZFA57sX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC10F28373;
	Sat, 12 Oct 2024 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728748277; cv=none; b=T0MJigVObEmMUM+hl/sFrMQPOxTTw//0yCLZFYa/OHQVPnuQDcgEwSDBV7vXSglWyAu8Rhbxn/AUXdk0RTFFfl4LPGPOeXK9xSMn4xqughmPxZLwhWj0FE6wUbdLo6iRe5I22jsrtG2MfOXCrS9/5GwWmtDY0KYyLZ0VO1hCrUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728748277; c=relaxed/simple;
	bh=QBxVjb4xRiX48s/vvPsUP77nS6zHCypmpcnHVq4sh5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsELs7cPrgv8Tl7NEYguMGtWHA/V3wjpTLOhtQKkeZqzht83cTSb7L5DU/+aL0y2CnrZNMVxz/wCO6OEOfs7O4YsETDz0b0C0dFvfHZy7I0Kr71F6v8vBKYuaWtZoaFBDf99sN5bZAaTJ+3CJKXCSlKC6Z2qP9n9Q3UmOTSE+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZFA57sX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20caccadbeeso14934375ad.2;
        Sat, 12 Oct 2024 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728748275; x=1729353075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nJuoVXcq5OgkJxuGdK+lNycEnFkCD62lKHCaH9k3Dm0=;
        b=KZFA57sXLuD0qnKlShYHcA0Ss7mdRqlrDDKszGbqWoy2FsgEkWGNsxRDoKAo2CEpjk
         R4pHuOBNQSopcBk6MiNoV3zNPWCqS52dlHPm5T+tYDM7NNrlezKC8jDoP6GO4i+cUN9v
         JXk7ZuD2zEV/OaR9hrdhd//mQSXsooZaTV1qF21hHmolC9ZUaiKtCdOIlyAjPGqq2K4t
         TFDDSDN/Sv34aV0etjaRjwJNBUVs/G2FPc5vB19v1ATs4Z1t1pIy5dfQxwQgRV5Qq5Hy
         HuGYoa/ev5N5zEpHsnvnxSijmC4X1OrmXLeSk+W8OGFzQ/3HT78kWbyFg7e9+HGw/90H
         j2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728748275; x=1729353075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJuoVXcq5OgkJxuGdK+lNycEnFkCD62lKHCaH9k3Dm0=;
        b=oPq6lfmELxkTBGutNT9/2oVFu89rEq0+FXV4/1MmSxtP+K7uFrlpwz/hJcy9mWGNW9
         h6jxF+t8x+cfjDDx4iZAUtm08H/6xUALHglHhSXrwPZS15jdSIPyhjlUMCFFDnF0RvJL
         2K8hmG8XR1tTrXFbPCjr2fXCY9egh8y4xXzNcK8R2UaEh67JIENw1FGx4id00sIvOWom
         Y3EYXEqAbJ00e70nolVR+g93S15dzX9BnRXe3NksqPgyUEj5D+9usOgOeUmkDC4PphDd
         E8o4GVD/w/8Eneh4v5cMlnhd1fPg293Vi84bcdh86r52EPoUvcAnFGE4D2U2eVGlsZtm
         ERIg==
X-Forwarded-Encrypted: i=1; AJvYcCV+A69Gv/IE644a2R2znMwBxl4eWthY7JYdX5/MELZPVNDhc9GSngCO7HtGj91HytHIYsJRK0ZnKMs0ifg=@vger.kernel.org, AJvYcCX14qINMhLaurXOUctqvYVHZVrFCWa2UK3HvLdrG9reF8zLqK36qKIZj2QPqlih/tAWdYaBzhsCcVa2gTeDjfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwbT5GgL2oeBlb4nTUeJGrXLKf5x1nwhWKS8VD6D+5W9VQTCW
	ez45qIHYR+ytN2i8BFeP4vv9Uwe2BSyc1dnrJsbRAiylk6mFtJ/q
X-Google-Smtp-Source: AGHT+IFhz4oOU4lWNGVF0APyrWUONmSyO4oWfYSnoTt0cmiYrE9tYiSHPfuf/fABxEjHG+AvdUnRdg==
X-Received: by 2002:a17:902:f549:b0:20b:7ec0:ee24 with SMTP id d9443c01a7336-20ca142a131mr105942135ad.9.1728748274880;
        Sat, 12 Oct 2024 08:51:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bada634sm38606355ad.5.2024.10.12.08.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 08:51:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <82433add-b157-4cb8-81f6-0dad6c49dfc7@roeck-us.net>
Date: Sat, 12 Oct 2024 08:51:12 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] watchdog: apple: Actually flush writes after
 requesting watchdog restart
To: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
References: <20241001170018.20139-1-towinchenmi@gmail.com>
 <20241001170018.20139-2-towinchenmi@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241001170018.20139-2-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/24 09:59, Nick Chan wrote:
> Although there is an existing code comment about flushing the writes,
> writes were not actually being flushed.
> 
> Actually flush the writes by changing readl_relaxed() to readl().
> 
> Fixes: 4ed224aeaf661 ("watchdog: Add Apple SoC watchdog driver")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Guenter Roeck  <linux@roeck-us.net>


