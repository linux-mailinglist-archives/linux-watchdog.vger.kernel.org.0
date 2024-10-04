Return-Path: <linux-watchdog+bounces-2091-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B99910F3
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E6691F22FFC
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1331ADFF4;
	Fri,  4 Oct 2024 20:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8HnhGwH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1EB231CBD;
	Fri,  4 Oct 2024 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075254; cv=none; b=CnFHM7EHqvyNirP2QV56RaYY8ENjNNwy0e4T15VOkDsa+GJ9RKZRvihS1Qb/yTfuLQGz+PR2OkBczedvaLtc0Pp5HRb9ro66uiYtVkjowA554IXx3aNtkZNvU+vxIySLhGydDi/+/A4kZ8ua9zw3lmu1v6wWnBnBXRMxtlAy1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075254; c=relaxed/simple;
	bh=rJmR7kk/eLAwzUSnwX/xy72+mRBqsvdjYCowRv/1dxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHSf2lo5tq+HG1g18Z9eKLGow4t9K9Q05uGgApY6JyTIPr1rtsZgJTyWjTJ21m+UlgrMfE4D5rbLGAXFKyAjLkEkmCPMQ7k4dKQRvndT8rfLDsvrjTB+rPGFrKJ24ZCZtlRsjo2tyTLHCwhtGak62kKRhIGo50NI7A9C+IyF2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8HnhGwH; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e192a2fe6cso1972600a91.3;
        Fri, 04 Oct 2024 13:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728075252; x=1728680052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NDrtbWAnCRDXNp6V1lvGpow9bGsLYc3ejZMEhSj8oY=;
        b=E8HnhGwHgbLDp6nqEl5LCfQmTPBMHULTGQVCwfLUW9QkfOhPHBvfwdpNzEsFESRUUr
         srVzyEgj5gvgr3US3S2p1Bg0j4wrBFnlWoVikH7StRyAdeEWE6S3i3L0i/qaAV3ANYQi
         MJDpsuMfbMQyE0/OABlexxbQuxGOllsT3sU8o7V44ES4iFvpYFGS0Btk+VpNxEnAiFCF
         gPsqmTQN6Ry89ySYc5zov6lf9Bcsfte+FB5DFoS4r8GYuyeFjDf+Qngrvm0E7ycja/Ta
         SZLt71p3tjuRT/AKnG//pjgr1Ct4fxITwbK6HBfBzuKFP0Gsc65GhLf+7j1eQnAfmiRy
         1EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075252; x=1728680052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NDrtbWAnCRDXNp6V1lvGpow9bGsLYc3ejZMEhSj8oY=;
        b=musjP8OEwh0MYuUAdTxfehLJhPjxQyyGUz8FTA018rODA0iKo8QvW79zIWAbamqIrG
         uSc6QwngoG7R+EZcd91doeWaeh2JXiz8tPP2VvRIlJ2ceMlVkDsVZAQ4Ebm3dhiWM16B
         EBLvmveww6sAdi41S16JA45V2qxzWnENYlkkogVp4flna+V3cqFNgpAt6MZyADkdq+lW
         Myinr/l0lWOoZaDR6CcUJEnQNc5mLpocqwEO7iTfAxRQZFSoO0Wei6omsHd2M+IajSj2
         DZCNrXn2J8Y3MLoH3xs1On6uN5sM3aigAYP+8dO1hVN0G1YHDFZyF2+Nd6ivXNR0ZYTa
         jpBw==
X-Forwarded-Encrypted: i=1; AJvYcCWLTvP/Tfx6TXtm8FvcOiTrwZM0r40nNXetefCS8gWu9clFWgCW9BXxyJAV8UJOufrFQwk7mNzs7cTECqMS9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YydPIpN41To5KKffZjScJzD9NUGLwB/e5CY794GgxwB56muEcdu
	UTBN4j7zdP/ONnrBq+U80JEoidtQGDmL6Teu/5OiloUKzOrkmxY4
X-Google-Smtp-Source: AGHT+IExCCg/7aeKb2JLzseNGl5JevpCe7cklW3RxFmg47TpKWPkWZfbdSEiJo4rCNVjpTixr7Dfsg==
X-Received: by 2002:a17:90a:b015:b0:2e0:6cd4:973a with SMTP id 98e67ed59e1d1-2e1e6211a0emr5661084a91.5.1728075251970;
        Fri, 04 Oct 2024 13:54:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b14c07fsm377249a91.55.2024.10.04.13.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:54:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Oct 2024 13:54:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 6/9] watchdog: octeon-wdt: don't print out if
 registering watchdog fails
Message-ID: <05402537-4933-4e97-9029-b8f880cb9004@roeck-us.net>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-7-wsa+renesas@sang-engineering.com>

On Fri, Oct 04, 2024 at 10:03:09PM +0200, Wolfram Sang wrote:
> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


