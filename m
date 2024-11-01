Return-Path: <linux-watchdog+bounces-2408-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76DA9B9AC9
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 23:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A611C20DF6
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 22:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9DC15820E;
	Fri,  1 Nov 2024 22:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bweWDkmU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9091BDC3;
	Fri,  1 Nov 2024 22:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730499583; cv=none; b=SnQnQzWTqDukqfc1CvMhNmvCgZERmTmTDVAupsFy4AzUCUVsy19zkBMa9C/85vtz6bS5ralLTpBiLj+gb8vx6eMJc7mBbpyQYU2vneUoZhPjXym5+Ee+z0IKEc2+iefo+4qlh13sTGJ7ZHK8/WkDXVA1fbTjtX2LN187GV9rEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730499583; c=relaxed/simple;
	bh=5iYsLNvcY55MFjvi6m/lq9x5QRZWvJ4M+x5E7SQySwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSRtxqwldkrVYuNdWlDxN4gv1y/29lztvH6ujIyNCLCNf04bUH1kmGjGPF+NluxaWGbnYi9U+1ll1CMF38tks+4fGG3F2GkKMSZscWyVbhdVBFRuR03wiXdPBAvNTvP4ndtGnIE/Uexn0SQdvZVxVlIxoNV7Rv0Wckp0310qa54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bweWDkmU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ee386ce3dfso2142757a12.1;
        Fri, 01 Nov 2024 15:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730499581; x=1731104381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ASiyIHn/3ii7xbeQI3Xm3CDe+0D7uWXjTz/CkcuvjF4=;
        b=bweWDkmUMniEXRuU/1LnD/56OGEoJKXHyBTbMirOzx33EEHcOxRsUI2k2mTcNJHbT7
         iyG5BSiD/ZR9W75XLWbBgwR9xlLTtMKvtRZY+bRCM6+hcQnNLZug4m1GoqZRAUnBRQuY
         z2dTAu65BSPCjWM4Hthwhq4PnqQW/Es5fFc55tl3Hn/9mfxJmMYlSGe6O14ueaE6I0g8
         Qgm9FEher7XyXyfthFpYPqF1WT8tL4u3rfn0/ReC/1rFiAhH+lLWs30v9mh36m6n7ElV
         oNAArhynOvfHpL9S9BitAe53jbR8cmEX9149wt9PG+BxcAdIHdSpkMEJ8qZcFxxAg4qx
         jMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730499581; x=1731104381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASiyIHn/3ii7xbeQI3Xm3CDe+0D7uWXjTz/CkcuvjF4=;
        b=WjxpbFJJEbPhlGcMrtiwtYy8cHUqZL4JlWteRnAE+9RQYYjYJIcs6WKSRKwxXigpY2
         nc+rb9i2dqrOrunQHFOuK93rUxPP+I5Es0wws3SVotuwxLq3Ghu+w9HWvC3HOrd26Cb4
         IukyTImaGvPb/GrmsqMngpf7uxJBO8MMFoAd9fiAzpqSE9jcvdt8la71TbKSIVriMpWA
         6RuZryfeFBWtMFZUCH/i1o4OqcQfo0Hig24l2pRtONK0uv0G4qJeKRLFfX9Gjj3GO0i4
         xELD2y37DkxSeWpyerrDVcQUGFcmZg0AG3B2ddBy9esNVffNWkvxUm/6Pwj16ssNZCDP
         /6Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUySjqemiH/qKypH51/Sm6tUeC4dXPOFBphUftfxUx/E4B5ToWz2aXIHsQ/ivS9/Ii4frUcM7/X8JibZzmLcWY=@vger.kernel.org, AJvYcCW/gNtbuFMXplY0V4Qla+Q+0cpGLvZAE2+bvyQpcc6KqNYskL0KoMVn4M6xHQMar2ywxcNfDsx3TWqZ6Z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGdarms0OeCl+7gL/yi4jlTv5kESCHOchbbUvOn4T57qEq4RG
	KDGW6clDhJsiGwe3o/gXwWozwpp8CZ1TddDlYeUczFDNzoIBpW1H
X-Google-Smtp-Source: AGHT+IHAfJoElGQs4UKDOuFUgAvAywk67B41uHrrSM/kNHKQQAzOFjjwRyqFsY4E1MH6AuvamYfeqA==
X-Received: by 2002:a17:90b:2e42:b0:2e0:7580:6853 with SMTP id 98e67ed59e1d1-2e93e0fab5amr11494578a91.17.1730499580566;
        Fri, 01 Nov 2024 15:19:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da98448sm3599311a91.6.2024.11.01.15.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 15:19:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c91f8b3c-ae3f-4d35-8b7f-2fb2b7cebebd@roeck-us.net>
Date: Fri, 1 Nov 2024 15:19:37 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] watchdog: aspeed: Change aspeed_wdt_config struct
 name to aspeed_wdt_data
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz,
 joel@jms.id.au, andrew@codeconstruct.com.au, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com,
 DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com, chnguyen@amperecomputing.com
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-3-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241101121201.2464091-3-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/24 05:12, Chin-Ting Kuo wrote:
> aspeed_wdt_config struct is used to store some HW configuration
> information. Changing its naming to a more generic one,
> aspeed_wdt_data, in order to contain more platform specific
> inforamtion or SW callback functions.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

I fail to see the point of this patch. It is just unnecessary churn.
Just like drivers should not be renamed because of an extended scope
or because someone doesn't like the old name, renaming variables should
be avoided as well. Such renames just make future bug fixes (which may
need to be backported) more difficult.

Guenter


