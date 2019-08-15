Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34DF8F319
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbfHOSTv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:19:51 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41269 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHOSTu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:19:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so1357216pls.8;
        Thu, 15 Aug 2019 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/WnnAy3vPYs2xCJK4iCiF9hGi6j3qUYp0Vrs6EUUYXA=;
        b=eomHg7MV9LnAQOH8LtjGn4VNktIaQdJGjM1ZpGeAoX7x3dBDwkF+dWteHeSH6Mj56/
         Aoud8KYaXZowxPbHtReUy12tYip05VWsf5mWTCypRXRVZceVxp08/twHV7HppZICvYQE
         9y4qq3VtFhXomlIclO+mqt00C0Oz7wtQ9Zz4LHX/xVLnyad4605qMKgBGdb71/rrnNGE
         u8cmpzGfe09NyftTlfxii4b5cMe4YjpQ+2kAYeCHHAwYBdQ6QgZdRVZaueIdaT8g2HCH
         h0GdoZhxukFnYnFB49m6iPzAd7lFL3mkQ7517x/itQb9gPRjN70JHAhPHtM1OBpGCruK
         T5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/WnnAy3vPYs2xCJK4iCiF9hGi6j3qUYp0Vrs6EUUYXA=;
        b=FoBTqfxwoPpej7r/qDMlx1vfbxzKtXJM59WgLj0H8MrZFxO/lmgL1kWCoznEAkzWyt
         1ZN8JGyIX4xv3h/E+6HA0M5ukqcaeLh6Mf6vA5XQCjyquEJJJjKvTInGETf1X1+0zS6b
         JRBXcyBJ3alZK1weBEyFPQcNrqkxLVXhA8N7fVROVhGJo+DQRItOlq6GK+tUrhssfQeA
         J1wDjIebjDI3Rl2iATFoXCoh7SdTjMf6DxmnxJbRSDZ9hx0R/mQH9M8W23vgng4FHzRU
         OOzfEhRT73BMysZ31ZlPo1EXyWqiqk9dL+iUqhsxWAv2yEcGfDBkRAmOObfjUcZGQuUn
         BGYw==
X-Gm-Message-State: APjAAAWhmF4aY+0kui3h21LCKk3x7mrPTTRV5XGUI8Bb73O+Htmon9b0
        IHxt1hdeACTVzFx6kif+mFg=
X-Google-Smtp-Source: APXvYqxyO8GzwFc+fm+5KVoG/o5VG9jxFC8vr0oDDTGgJu8ybhDz2J6e35YSaWAVYcqljTyno/OTnw==
X-Received: by 2002:a17:902:246:: with SMTP id 64mr399317plc.112.1565893190150;
        Thu, 15 Aug 2019 11:19:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j15sm3380650pfr.146.2019.08.15.11.19.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:19:49 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:19:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/22] watchdog: ziirave_wdt: Don't read out more than
 'len' firmware bytes
Message-ID: <20190815181948.GI14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-14-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-14-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:57PM -0700, Andrey Smirnov wrote:
> We only compare first 'len' bytes of read firmware, so we don't need
> to read more that that.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
