Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8C58F2ED
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731211AbfHOSMP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:12:15 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39050 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730474AbfHOSMP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:12:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id u17so1632290pgi.6;
        Thu, 15 Aug 2019 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n9tUkG7lD8HBZBIfJu4sHWhJeh6vg7iC3im3UhLYB78=;
        b=GWy0WOuF1yD+p7ShPnwB9tU5z2eta0obVE2c5a2C066QeGhwW48ZdMnzHSPRJKoe8d
         bajI7UKzxlBpoF/5H7WbgVtUpuoTr+6E1Zkeu6O5DGIWQ3aayNSDDpfarITDEJjAg4sN
         r/UHUb02gg9rKLcN6+pwFdQczJYFKX+6WBsarS0K4coff0Nybr9BIP63KN6gNZoCczuP
         SgPdZJthkEGEhRMVjEzM0s3XMVY8BGwkPJcDAvoxpxS2pkTpaLt77FKBNdc96dxqyeO8
         DvftPVphIa6BfyA6TzUuEUDblNXBjE+ux4H/+yt7rJpN32Ti3s1V/V6m7wkS2DcNFLTb
         oL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=n9tUkG7lD8HBZBIfJu4sHWhJeh6vg7iC3im3UhLYB78=;
        b=RVkv3sm1luQTagjKz5lv3OKIeDQzuvW2OGYfMWuLUZlGIM7tb+4CaHBvVJbat8ugMC
         sOOUe/vtmieUIFiSoNLGritXM0ofboCaeWhQhHmCmYOsQnTDHkOkz2+AJrKM/+3Ql9YT
         xgNDM8MBiPbk4BI4dv1UwPcJfhuucTiXHjq+MihRH6GMIsszUnr5kQDl2DWDtQEVv7G0
         RInBCWQr7Qj4ttPK5oxFF2koAdiBBS8uooAdvGjc90OdxI/x0WH7su25xQy4Y3CTFVwe
         bFSIOen08F7ZjFevdLmM3aAoA5q8a7js95u5fajym98QnjnRQXH1Qq9Ls7yN3cxSXFAS
         TRNA==
X-Gm-Message-State: APjAAAVK4zheUq/DDYF9Qcxu+r2wh9+NTVZwIE/Yc435lJNlfYFKBMzd
        bvQVga56bMIXQoh8YQYaie8=
X-Google-Smtp-Source: APXvYqy3ZsrSdpCRks8cJhp/ftXr7OVvrV+UaVSt653H/GnIWE4REvYlquujbaMe2nfOmJKlPj9+tw==
X-Received: by 2002:a62:7912:: with SMTP id u18mr7060592pfc.254.1565892735146;
        Thu, 15 Aug 2019 11:12:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j1sm2558476pgl.12.2019.08.15.11.12.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:12:14 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:12:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/22] watchdog: ziirave_wdt: Don't bail out on
 unexpected timeout value
Message-ID: <20190815181213.GA14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-5-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-5-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:48PM -0700, Andrey Smirnov wrote:
> Reprogramming bootloader on watchdog MCU will result in reported
> default timeout value of "0". That in turn will be unnecessarily
> rejected by the driver as invalid device (-ENODEV). Simplify probe to
> read stored timeout value, set it to a sane default if it is bogus,
> and then program that value unconditionally.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
